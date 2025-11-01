# single command to get revvin / Next-gen things running
#
#
function revvin-start
  argparse 'k/keep' 'h/help' -- $argv
  or return # should we just ignore unrecognized arguments?
  # cleanup existing session, unless --no-delete/-nd
  if set -ql _flag_help
    echo "revvin-start : start up NextGen dev env"
    echo "   -- start docker external dependencies"
    echo "   -- cleanup existing 'rev-dev' zellij session (unless --keep flag passed)"
    echo "   -- check if aws sso token needs a refresh"
    echo "   -- start fresh 'rev-dev' session"
    echo ""
    echo "usage: revvin-start [-k|--keep] [-h|--help]"
    return 0
  end

  set -f SESSION_NAME rev-dev

  if ! set -ql _flag_keep
    zellij delete-session --force $SESSION_NAME 2>/dev/null
  end

  cd $REVVIN_SETUP_PATH

  # start background services (postgres, rabbitMQ, etc.)
  docker compose -f docker-compose-external.yml up -d --remove-orphans & wait $last_pid

  # timezone = UTC to match aws token TZ
  set -gx TZ UTC
  set -l time_now (date +"%s")
  set -l aws_token_expires_at (
    # look for .startUrl key in json files and exclude files that don't have it
    set -l cache_files (find ~/.aws/sso/cache -type f -not -name "botocore*.json")
    cat $cache_files | jq -sc '.[] | select(has("startUrl")) | .expiresAt' | xargs -J % date -jf "%FT%TZ" % +"%s"
  )
  # if no token file is found, default this to 0
  if ! set -q aws_token_expires_at
    set -l aws_token_expires_at 0
  end

  # unsure TZ env variable is unset
  set -e TZ
  
  if test $time_now -ge $aws_token_expires_at
    echo "need to refresh aws token..."

    aws sso login --profile $SESSION_NAME
  end

  # start up zellij with the full revvin layout
  zellij  --new-session-with-layout revvin-dev-start --session $SESSION_NAME
end
