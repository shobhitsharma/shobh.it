# Exit if any subcommand fails.
set -e

echo "Starting deploy to https://shobh.it"

# Get repo up-to-date
git config --global pull.default current
git reset --hard HEAD # we don't want the `git checkout` to cause issues
git pull origin master

# Build the docs page locally
export JEKYLL_ENV="production"
bundle install
bundle exec jekyll clean
bundle exec jekyll build

# Assign permissions
chmod -R a+rX *

echo "Deployed successfully, check out https://shobh.it"
echo "If you're running this on your local machine, please make sure to reset your git user credentials (username and email) to not be the bot"

exit 0
