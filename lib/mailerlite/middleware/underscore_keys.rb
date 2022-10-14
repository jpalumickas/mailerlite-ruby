# frozen_string_literal: true

module MailerLite
  module Middleware
    # This class will underscore all response keys from CamelCase.
    class UnderscoreKeys < Faraday::Middleware
      def on_complete(response)
        response[:body] = updated_response(response[:body])
      end

      private

      def updated_response(response)
        if response.is_a?(Hash)
          underscore_hash_keys(response)
        else
          response
        end
      end

      def underscore_hash_keys(hash)
        hash.each_with_object({}) do |(k, v), new_hash|
          key = MailerLite::Utils.underscore(k.to_s)
          new_hash[key] = updated_response(v)
        end
      end
    end
  end
end
