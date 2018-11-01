# frozen_string_literal: true

module MailerLite
  # Base MailerLite error.
  class Error < StandardError
    def initialize(msg = nil)
      @message = msg
    end

    # Returns the appropriate MailerLite::Error sublcass based on status and
    # response message.
    #
    # @param response [Faraday::Env] HTTP response.
    #
    # @return [MailerLite::Error]
    def self.from_response(response)
      status = response.status.to_i
      message = error_message(response)

      klass = error_class(status)
      klass.new(message) if klass
    end

    def self.error_class(status)
      case status
      when 400 then MailerLite::BadRequest
      when 401 then MailerLite::Unauthorized
      when 404 then MailerLite::NotFound
      when 429 then MailerLite::TooManyRequests
      when 500 then MailerLite::InternalServerError
      end
    end

    # Returns the appropriate MailerLite error message based on response
    #
    # @param response [Faraday::Env] HTTP response.
    #
    # @return [String] MailerLite error message.
    def self.error_message(response)
      return unless response.body.is_a?(Hash)
      return unless response.body['error']

      message = response.body['error']['message']
      MailerLite::Utils.presence(message)
    end
  end

  # Raised when MailerLite returns a 400 HTTP status code
  class BadRequest < Error
    # Default error message.
    def to_s
      @message || 'Missing a required parameter or calling invalid method'
    end
  end

  # Raised when MailerLite returns a 401 HTTP status code
  class Unauthorized < Error
    # Default error message.
    def to_s
      @message || 'Invalid API key provided'
    end
  end

  # Raised when MailerLite returns a 404 HTTP status code
  class NotFound < Error
    # Default error message.
    def to_s
      @message || "Can't find requested items"
    end
  end

  # Raised when MailerLite returns a 500 HTTP status code
  class InternalServerError < Error
    # Default error message.
    def to_s
      @message || 'The server encountered an unexpected condition'
    end
  end

  # Raised when MailerLite returns a 429 HTTP status code
  class TooManyRequests < Error
    # Default error message.
    def to_s
      @message || 'Too Many Requests'
    end
  end
end
