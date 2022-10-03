# frozen_string_literal: true

module MailerLite
  module Middleware
    # This middleware will convert empty response to {}
    class FixUnparsedJson < Faraday::Middleware
      def parse(body)
        return '{}' if body == ''

        body
      end
    end
  end
end
