#
# function to set Okta rekated ENV variables before stating up local server
#
function hb-rails-server
  # FYI kebab-case doesn't work for flags (e.g. test-mode won't get recognized)
  argparse 'okta_admin' 'no_admin' 'sendgrid' 'test_mode' -- $argv
  
  set -x WEB_CONCURRENCY 1
  set -x LOAD_ACTIVE_ADMIN  1

  if set -ql _flag_no_admin
    set --erase LOAD_ACTIVE_ADMIN
  end

  if set -ql _flag_okta_admin
    # this will prompt for 1Password authentication (fingerprint etc.)
    set client_id (op read "op://Engineering/HomebaseAdmin - Local Dev/Client ID")
    set secret (op read "op://Engineering/HomebaseAdmin - Local Dev/Secret")

    if test -n "$client_id" -a -n "$secret"
      echo "setting okta ENV variables"
      set -x REQUIRE_LOCAL_OKTA_LOGIN 1
      set -x OKTA_OAUTH2_CLIENT_ID $client_id
      set -x OKTA_OAUTH2_CLIENT_SECRET $secret
    else
      echo "⚠️Unable to set HomebaseAdmin Okta ENV variables from 1Password"
    end
  end

  if set -ql _flag_sendgrid
    set sendgrid_api_key (op read --account homebase-team.1password.com "op://Employee/bberger Sendgrid Key/credential" --no-newline)
    set sendgrid_key_id (op read --account homebase-team.1password.com "op://Employee/bberger Sendgrid Key/username" --no-newline)

    if test -n "$sendgrid_api_key"
      echo "setting sendgrid api key 📧 -> $sendgrid_key_id"
      set -x SENDGRID_API_KEY $sendgrid_api_key
      set -x ENABLE_NOTIFICATIONS 1
    end
  end

  if set -ql _flag_test_mode
    echo "STARTING RAILS SERVER IN TEST MODE"
    set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES
    bundle exec rails server -e test
  else
    echo "STARTING RAILS SERVER IN DEV MODE"
    bundle exec rails server -b 0.0.0.0
  end
end
