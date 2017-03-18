abbr go="git checkout"
abbr gs="git status"
abbr gcm="git commit -m"
abbr ga="git add"
abbr gp="git push"

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

set fish_color_command blue

function fish_prompt
  set -l last_status $status
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l yellow (set_color -o yellow)
  set -l normal (set_color normal)

  if test $last_status = 0
      set status_indicator "$blue✔︎ "
  else
      set status_indicator "$red✗ "
  end
  set -l cwd $blue(basename (prompt_pwd))

  if [ (_git_branch_name) ]

    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$normal ($red$git_branch$normal)"
    else if test (_git_branch_name) = 'dev'
      set -l git_branch (_git_branch_name)
      set git_info "$normal ($yellow$git_branch$normal)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal ($blue$git_branch$normal)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$red ✗"
      set git_info "$git_info$dirty"
    end
  end

  # Notify if a command took more than 5 minutes
  if [ "$CMD_DURATION" -gt 300000 ]
    echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $status_indicator $cwd $git_info $normal ' '
end
