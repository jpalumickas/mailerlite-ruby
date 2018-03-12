source 'https://rubygems.org'

group :development do
  gem 'guard-rspec', '~> 4.7'
  gem 'jpalumickas-rubocop-config',
    git: 'https://github.com/jpalumickas/rubocop-config.git',
    require: false
  gem 'rubocop', '~> 0.53'
end

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rake' # For Travis CI
  gem 'rspec', '~> 3.7'
  gem 'simplecov', '~> 0.15', require: false
  gem 'webmock', '~> 2.3'
end

gemspec
