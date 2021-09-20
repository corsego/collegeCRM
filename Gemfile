# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails', '~> 6.1.3.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# gem 'devise'
gem 'devise', github: 'heartcombo/devise', branch: 'master' # https://stackoverflow.com/a/66155946/5695646
gem 'omniauth-google-oauth2'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'devise_invitable', '~> 2.0.0'
gem 'omniauth-rails_csrf_protection'

gem 'invisible_captcha'

group :production do
  gem 'exception_notification'
end

gem 'simple_form'
gem 'ice_cube'
gem 'simple_calendar', '~> 2.0'
gem 'cocoon'
gem 'money-rails', '~>1.12'
