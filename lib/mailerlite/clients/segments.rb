# frozen_string_literal: true

module MailerLite
  module Clients
    # MailerLite Segments
    module Segments
      # Get list of segments
      #
      # @see https://developers.mailerlite.com/v2/reference#segments-1
      #
      # @param options [Hash] Options list. See more in MailerLite docs.
      # @option options [Integer] :offset
      # @option options [Integer] :limit
      # @option options [String] :order asc or desc
      #
      # @return [Array] Response from API.
      def segments(options = {})
        connection.get('segments', options)
      end
    end
  end
end
