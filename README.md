# Web Source for shobh.it

This site is powered by jekyll framework for Ruby. It can be hosted privately on server or through github gh-pages.

### Installation

Assuming ruby is installed in your OS. If not, try for example macOS:

```bash
$ brew install ruby
$ gem install --user-install bundler jekyll
```

For local development using jekyll:

```bash
$ bundle install
$ bundle exec jekyll serve
```

### Deployment

```bash
$ JEKYLL_ENV=production bundle exec jekyll build 

# OR 
$ ./deploy.sh
```