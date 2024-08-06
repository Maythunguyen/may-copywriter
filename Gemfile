source "https://rubygems.org"

ruby "3.3.4"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "sprockets-rails"
gem "pg", "~> 1.1" # Move this out of the production group
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
gem "devise"
gem "ruby-openai", '~> 3.0'
gem "dotenv-rails", groups: [:development, :test]
gem "tailwindcss-rails", "~> 2.6"

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :development, :test do
  gem 'factory_bot_rails'
end


group :development, :test do
  gem 'rspec-rails', '~> 5.1.2'
end
