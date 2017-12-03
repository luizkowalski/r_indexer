source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem 'react-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'minitar'
gem 'treetop-dcf'

gem 'sidekiq'
gem 'sidecloq'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'database_rewinder'
  gem 'vcr'
  gem 'webmock'
  gem 'simplecov'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
