require 'mailerlite/connection'
require 'mailerlite/configuration'

require 'mailerlite/clients/campaigns'
require 'mailerlite/clients/fields'
require 'mailerlite/clients/groups'
require 'mailerlite/clients/subscribers'

module MailerLite
  # Wrapper class for all actions.
  class Client
    include MailerLite::Clients::Campaigns
    include MailerLite::Clients::Fields
    include MailerLite::Clients::Groups
    include MailerLite::Clients::Subscribers

    # Initialize client.
    #
    # @param options [Hash] A customizable set of options.
    # @option options [String] :api_key API Key provider from MailerLite.
    def initialize(options = {})
      config.api_key = options[:api_key] if options[:api_key]
    end

    # @return [Configuration]
    def config
      @config ||= Configuration.new
    end
    alias configuration config

    # Configure client with a block of settings.
    def configure
      yield(config) if block_given?
      true
    end

    # @return [Connection]
    def connection
      @connection ||= Connection.new(self)
    end
  end
end
