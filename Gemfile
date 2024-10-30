# frozen_string_literal: true

source "https://rubygems.org"

ruby "~> 3.3"

# dotenv
gem "dotenv", require: "dotenv/load", groups: [:development, :test]

# middleman
gem "middleman"

# for Ruby 3.4 deprecation warnings
gem "bigdecimal"
gem "mutex_m"
gem "ostruct"
gem "rake"
gem "rdoc"

gem "googlestaticmap"
gem "haml", "~> 5.0"
gem "middleman-autoprefixer"
gem "middleman-cloudfront"
gem "middleman-favicon-maker"
gem "middleman-meta-tags"
gem "middleman-minify-html"
gem "middleman-s3_sync", git: "https://github.com/fredjean/middleman-s3_sync", ref: "39c3b84aafadbc8496f8fd8a139ef0117cfba62a"
gem "normalize-scss"
gem "sassc"

# Development
group :development do
  gem "license_finder", require: false
  gem "pivotal_git_scripts", require: false
end

# Local only
group :development, :test do
  gem "rspec"
  gem "standard", require: false
  gem "standard-rspec", require: false
end

# Test
group :test do
  gem "axe-core-capybara"
  gem "axe-core-rspec"
  gem "capybara-screenshot"
  gem "cuprite"
  gem "launchy"
  gem "rspec_junit_formatter", require: false
  gem "rubocop-junit-formatter", require: false
end
