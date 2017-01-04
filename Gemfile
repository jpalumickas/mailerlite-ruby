source 'https://rubygems.org'

group :development do
  gem 'guard-rspec', '~> 4.7'
  gem 'rubocop', '~> 0.46'
end

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0', require: false
  gem 'coveralls', '~> 0.8', require: false
  gem 'rake' # For Travis CI
  gem 'rspec', '~> 3.5'
  gem 'simplecov', '~> 0.12', require: false
  gem 'webmock', '~> 2.3'
end

gemspec
