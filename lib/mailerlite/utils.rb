# frozen_string_literal: true

module MailerLite
  module Utils
    BLANK_RE = /\A[[:space:]]*\z/.freeze

    class << self
      def underscore(string)
        string.gsub('::', '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
      end

      def blank?(obj)
        return !!BLANK_RE.match(obj) if obj.is_a?(String)

        obj.respond_to?(:empty?) ? !!obj.empty? : !obj
      end

      def present?(obj)
        !blank?(obj)
      end

      def presence(obj)
        obj if present?(obj)
      end
    end
  end
end
