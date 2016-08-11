module MailerLite
  # Base MailerLite error.
  class Error < StandardError
    # Returns the appropriate MailerLite::Error sublcass based on status and
    # response message.
    #
    # @param response [Hash] HTTP response.
    #
    # @return [MailerLite::Error]
    def self.from_response(response)
      status = response[:status].to_i

      klass = case status
      when 400 then MailerLite::BadRequest
      when 401 then MailerLite::Unauthorized
      when 404 then MailerLite::NotFound
      when 500 then MailerLite::InternalServerError
      end

      klass.new if klass
    end
  end

  # Raised when MailerLite returns a 400 HTTP status code
  class BadRequest < Error
    # Default error message.
    def to_s
      'Missing a required parameter or calling invalid method'
    end
  end

  # Raised when MailerLite returns a 401 HTTP status code
  class Unauthorized < Error
    # Default error message.
    def to_s
      'Invalid API key provided'
    end
  end

  # Raised when MailerLite returns a 404 HTTP status code
  class NotFound < Error
    # Default error message.
    def to_s
      "Can't find requested items"
    end
  end

  # Raised when MailerLite returns a 500 HTTP status code
  class InternalServerError < Error
    # Default error message.
    def to_s
      'The server encountered an unexpected condition'
    end
  end
end
