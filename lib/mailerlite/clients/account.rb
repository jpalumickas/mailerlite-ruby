module MailerLite
  module Clients
    # MailerLite Account
    module Account
      # Get account information.
      #
      # @see https://developers.mailerlite.com/v2/reference#account
      #
      # @return [Hash] Response from API.
      def account
        result = connection.get('me')
        result && result.account
      end

      # Get account information.
      #
      # @see https://developers.mailerlite.com/v2/reference#stats
      #
      # @return [Hash] Response from API.
      def stats
        connection.get('stats')
      end
    end
  end
end
