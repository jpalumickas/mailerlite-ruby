# frozen_string_literal: true

require 'faraday'
require 'faraday/follow_redirects'
require 'faraday/mashify'
require 'json'

require 'mailerlite/mash'
require 'mailerlite/middleware/raise_error'
require 'mailerlite/middleware/underscore_keys'
require 'mailerlite/middleware/fix_unparsed_json'

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

    def put(path, options = {})
      request(:put, path, {}, options).body
    end

    def post(path, options = {})
      request(:post, path, {}, options).body
    end

    def delete(path, options = {})
      request(:delete, path, options).body
    end

    private

    def request(method, path, query_params = {}, body_params = {})
      connection.send(method, path) do |request|
        request.params = query_params unless query_params.empty?
        request.body = body_params.to_json unless body_params.empty?
      end
    end

    def connection
      conn_opts = {
        url: client.config.url,
        builder: middleware,
        headers: headers
      }
      timeout = client.config.timeout
      conn_opts[:request] = { timeout: timeout } unless timeout.nil?

      Faraday.new(conn_opts)
    end

    def headers
      headers = {
        'User-Agent' => client.config.user_agent,
        'Content-Type' => 'application/json'
      }

      headers['X-MailerLite-ApiKey'] = client.config.api_key if client.config.api_key

      headers
    end

    def middleware
      @middleware ||= Faraday::RackBuilder.new do |builder|
        builder.request :json

        builder.response :follow_redirects
        builder.response :mashify, mash_class: MailerLite::Mash
        builder.use MailerLite::Middleware::UnderscoreKeys
        builder.use MailerLite::Middleware::RaiseError
        builder.response :json
        builder.use MailerLite::Middleware::FixUnparsedJson

        builder.adapter Faraday.default_adapter
      end
    end
  end
end
