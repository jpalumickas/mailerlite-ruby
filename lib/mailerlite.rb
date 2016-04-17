require 'mailerlite/version'
require 'mailerlite/error'
require 'mailerlite/configuration'
require 'mailerlite/client'

require 'faraday'

module MailerLite
  class << self
    def client
      @client ||= MailerLite::Client.new
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end
