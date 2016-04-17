require 'faraday'
require 'faraday_middleware'
require 'json'

require 'mailerlite/middleware/raise_error'
require 'mailerlite/middleware/underscore_keys'

module MailerLite
  # A class responsible for connecting to MailerLite API and making requests.
  class Connection
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get(path, options = {})
      request(:get, path, options).body
    end

    def delete(path, options = {})
      request(:delete, path, options).body
    end

    def post(path, options = {})
      options['apiKey'] = client.config.api_key

      response = connection.post do |req|
        req.url(path)
        req.headers['Content-Type'] = 'application/json'
        req.body = options.to_json
      end

      response.body
    end

    private

    def request(method, path, options = {})
      options['apiKey'] = client.config.api_key

      response = connection.send(method) do |request|
        request.url(path, options)
      end

      response
    end

    def connection
      conn_opts = {
        headers: { user_agent: client.config.user_agent },
        url: client.config.url,
        builder: middleware
      }

      Faraday.new(conn_opts)
    end

    def middleware
      @middleware ||= Faraday::RackBuilder.new do |builder|
        builder.request :json

        builder.use FaradayMiddleware::FollowRedirects
        builder.use FaradayMiddleware::Mashify
        builder.use MailerLite::Middleware::UnderscoreKeys
        builder.use FaradayMiddleware::ParseJson
        builder.use MailerLite::Middleware::RaiseError

        builder.adapter Faraday.default_adapter
      end
    end
  end
end
