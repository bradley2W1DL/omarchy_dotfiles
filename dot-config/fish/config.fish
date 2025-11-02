if status is-interactive
    # Commands to run in interactive sessions can go here
end

## DEFAULT FISH COLOR OVERRIDES ##
set fish_color_valid_path cyan # no underline
set fish_color_command normal

## THEME COLOR OVERRIDES ##
set pure_color_primary green
set pure_color_git_branch pure_color_light
set pure_color_prompt_on_success white 

## activate Mise - package manager
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

## add homebrew to path
fish_add_path /opt/homebrew/bin

## ALIASES ##
alias vim=nvim
alias n=nvim
abbr -a be 'bundle exec'

# go back two directories
function ...
  ../..
end

# function heroku-console
#   heroku run -a $argv[1] -e CONSOLE_USER=$CONSOLE_USER "bundle exec rails console -- --nomultiline"
# end

function set-upstream
  git branch --set-upstream-to=origin/(git branch --show-current) (git branch --show-current)
end

# set -x CONSOLE_USER bradley@himaxwell.com
set -x EDITOR nvim

## OSX + rails + puma 6.1+ support
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES

## OPENAI_KEY is used by ChatGPT.nvim plugin -- set from 1password
if ! type -q op
  echo "⚠️  unable to set OPENAI_KEY var becuase 1password cli plugin not installed!"
end
if type -q op && test -z "$OPENAI_API_KEY"
  echo "setting openai key in env 🤖"
  set -Ux OPENAI_API_KEY (op --account my.1password.com read op://Private/openAI_chatGPT.nvim/credential --no-newline)
end


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
# source ~/.orbstack/shell/init2.fish 2>/dev/null || :
