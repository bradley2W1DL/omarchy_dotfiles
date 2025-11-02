# Given a commit sha, search current dirs git log output for commit message
# this can be useful for finding PR numbers in commit messages

function pr-msg
  if test (count $argv) -eq 0
    echo "Usage: 'pr-msg <COMMIT_SHA>'"
    echo "   optional --lines -l flag can be passed to specify num of lines to output"
    return
  end

  argparse l/lines= -- $argv
  or return

  if set -ql _flag_lines
    git log | rg -A $_flag_lines $argv[1]
  else
    git log | rg -A 10 $argv[1]
  end
end

