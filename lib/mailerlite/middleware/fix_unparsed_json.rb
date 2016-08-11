module MailerLite
  module Middleware
    # This middleware will convert empty response to {}
    class FixUnparsedJson < Faraday::Response::Middleware
      private

      def on_complete(response)
        response[:body] = {} if response[:body] == ''
      end
    end
  end
end
