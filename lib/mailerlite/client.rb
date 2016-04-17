require 'mailerlite/connection'
require 'mailerlite/configuration'

require 'mailerlite/clients/campaigns'
require 'mailerlite/clients/lists'

module MailerLite
  class Client
    include MailerLite::Clients::Campaigns
    include MailerLite::Clients::Lists

    def initialize(options = {})
      config.api_key = options[:api_key] if options[:api_key]
    end

    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config) if block_given?
      true
    end

    def connection
      @connection ||= Connection.new(self)
    end
  end
end
