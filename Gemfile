# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7'

gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'config', '~> 2.0'
gem 'devise', '~> 4.7'
gem 'dotenv-rails', '~> 2.5'
gem 'faker', '~> 2.0'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pygments.rb', '~> 1.2', '>= 1.2.1'
gem 'rails', '~> 6.0.0'
gem 'redcarpet', '~> 3.3', '>= 3.3.4'
gem 'rouge', '~> 3.3'
gem 'rubocop-github'
gem 'rubocop-performance', require: false
gem 'rubocop-rails', require: false
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'webpacker'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'

group :production do
  gem 'passenger', '~> 6.0'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'puma', '~> 4.0'
  gem 'rspec-rails', '~> 4.0'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
