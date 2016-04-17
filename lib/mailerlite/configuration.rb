require 'faraday_middleware'
require 'mailerlite/middleware/raise_error'

module MailerLite
  class Configuration
    # Default API endpoint
    API_ENDPOINT = 'https://app.mailerlite.com/api/v1'.freeze

    # Default User Agent header string
    USER_AGENT = "MailerLite Ruby v#{MailerLite::VERSION}".freeze

    attr_accessor :api_key

    def url
      API_ENDPOINT
    end

    def user_agent
      USER_AGENT
    end

    def middleware
      Faraday::RackBuilder.new do |builder|
        builder.request :json

        builder.use FaradayMiddleware::FollowRedirects
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson
        builder.use MailerLite::Middleware::RaiseError

        builder.adapter Faraday.default_adapter
      end
    end
  end
end
