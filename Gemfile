source 'https://rubygems.org'

group :development do
  gem 'guard-rspec', '~> 4.6.5'
end

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'coveralls', '~> 0.8.13', require: false
  gem 'rake' # For Travis CI
  gem 'rspec', '~> 3.5'
  gem 'simplecov', '~> 0.11.2', require: false
  gem 'webmock', '~> 1.24.3'
end

gemspec
