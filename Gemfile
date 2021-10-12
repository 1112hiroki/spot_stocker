source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

gem 'rails', '~> 6.0.1'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'jbuilder', '~> 2.7'
gem 'image_processing', '~> 1.9.3'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'simple_form'
gem 'coffee-rails', '~> 5.0'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'font-awesome-sass', '~> 5.9.0'
gem 'devise'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'slim-rails'
# gem 'html2slim'
gem 'kaminari'
gem 'jp_prefecture'
gem 'ransack'
gem 'seed-fu'
gem 'geocoder'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'aws-sdk-s3'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec_junit_formatter'
end

group :production do
  gem 'mysql2'
end

group :production, :staging do
  gem 'unicorn'
end