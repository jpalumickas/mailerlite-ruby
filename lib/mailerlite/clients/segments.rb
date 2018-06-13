module MailerLite
  module Clients
    # MailerLite Segments
    module Segments
      # Get list of segments
      #
      # @see https://developers.mailerlite.com/v2/reference#segments-1
      #
      # @return [Array] Response from API.
      def segments
        connection.get('segments')
      end
    end
  end
end
