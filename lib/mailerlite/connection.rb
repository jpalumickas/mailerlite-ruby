module MailerLite
  class Connection
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get(path, options = {})
      request(:get, path, options).body
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
        builder: client.config.middleware
      }

      Faraday.new(conn_opts)
    end
  end
end
