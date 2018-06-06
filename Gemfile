# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

# middleman
gem 'middleman', '~> 4.2'

gem 'googlestaticmap'
gem 'middleman-autoprefixer', '~> 2.7'
gem 'middleman-cloudfront'
gem 'middleman-dotenv'
gem 'middleman-favicon-maker'
gem 'middleman-google-analytics'
gem 'middleman-meta-tags'
gem 'middleman-minify-html'
gem 'middleman-s3_sync'
gem 'normalize-scss'
gem 'sass'
gem 'sass-globbing'

# Development
group :development do
  gem 'guard-livereload', require: false
  gem 'license_finder', require: false
  gem 'pivotal_git_scripts', require: false
end

# Local only
group :development, :test do
  gem 'rspec'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

# Test
group :test do
  gem 'axe-matchers'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'chromedriver-helper'
  gem 'launchy'
  gem 'rspec_junit_formatter', require: false
  gem 'rubocop-junit-formatter', require: false
  gem 'selenium-webdriver'
end
