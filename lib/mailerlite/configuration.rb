require 'faraday_middleware'

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
  end
end
