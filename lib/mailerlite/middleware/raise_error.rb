# frozen_string_literal: true

module MailerLite
  # Faraday response middleware
  module Middleware
    # This class raises an exception based HTTP status codes returned
    # by the API.
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        error = MailerLite::Error.from_response(response)
        raise error if error
      end
    end
  end
end
