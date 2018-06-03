# Exit if any subcommand fails.
set -e

echo "Starting deploy to https://shobh.it"

# Get repo up-to-date
git reset --hard HEAD # we don't want the `git checkout` to cause issues
git pull origin master

# Build the docs page locally
export JEKYLL_ENV="production"
bundle install
bundle exec jekyll build

# Delete old directories (if any)
rm -rf "/tmp/shobh.it"

# Copy the generated website to the temporary directory
cp -R "_site/" "/tmp/shobh.it"

# Copy the finished HTML pages to the current directory
cp -R /tmp/shobh.it/* .

# Assign permissions
chmod -R a+rX *

echo "Deployed successfully, check out https://shobh.it"
echo "If you're running this on your local machine, please make sure to reset your git user credentials (username and email) to not be the bot"

exit 0
