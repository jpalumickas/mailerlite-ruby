$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
require 'coveralls'
require 'codeclimate-test-reporter'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter,
  CodeClimate::TestReporter::Formatter
]

SimpleCov.start

require 'mailerlite'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow: ['coveralls.io', 'codeclimate.com'])

def fixtures_dir
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.join(fixtures_path, "#{file}.json")
end
