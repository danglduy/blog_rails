source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby ">= 2.4.1"

gem "bcrypt", "~> 3.1", ">= 3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.1", ">= 4.1.1"
gem "bootstrap-will_paginate", "~> 1.0"
gem "coffee-rails", "~> 4.2"
gem "devise", "~> 4.2"
gem "faker", "~> 1.8", ">= 1.8.7"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~> 4.3", ">= 4.3.3"
gem "pg", ">= 0.18", "< 2.0"
gem "pygments.rb", "~> 1.2", ">= 1.2.1"
gem "rails", "~> 5.2.0"
gem "redcarpet", "~> 3.3", ">= 3.3.4"
gem "rouge", "~> 3.3"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "simplemde-rails", "~> 1.11", ">= 1.11.2"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "wdm", ">= 0.1.0" if Gem.win_platform?
gem "will_paginate", "~> 3.1", ">= 3.1.6"

group :production do
  gem "passenger", "~> 5.3", ">= 5.3.5"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "puma", "~> 3.11"
  gem "sqlite3", "~> 1.3", ">= 1.3.13"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
