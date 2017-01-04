$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
require 'coveralls'
require 'codeclimate-test-reporter'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter,
]

SimpleCov.start

require 'mailerlite'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow: ['coveralls.io', 'codeclimate.com'])

def fixtures_dir
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(File.join(fixtures_dir, "#{file}.json"))
end

def json_response(fixture_name)
  {
    body: fixture(fixture_name),
    headers: {
      content_type: 'application/json; charset=utf-8'
    }
  }
end

def base_url
  'https://api.mailerlite.com/api/v2'
end

def stub_get_command(action, fixture, options = {})
  stub_request(:get, "#{base_url}/#{action}")
    .with(query: options, headers: { 'X-MailerLite-ApiKey' => 'test_key' })
    .to_return(json_response(fixture))
end

def stub_delete_command(action, fixture, options = {})
  stub_request(:delete, "#{base_url}/#{action}")
    .with(query: options, headers: { 'X-MailerLite-ApiKey' => 'test_key' })
    .to_return(json_response(fixture))
end

def stub_post_command(action, fixture, options = {})
  stub_request(:post, "#{base_url}/#{action}")
    .with(body: options, headers: { 'X-MailerLite-ApiKey' => 'test_key' })
    .to_return(json_response(fixture))
end

def stub_put_command(action, fixture, options = {})
  stub_request(:put, "#{base_url}/#{action}")
    .with(body: options, headers: { 'X-MailerLite-ApiKey' => 'test_key' })
    .to_return(json_response(fixture))
end
