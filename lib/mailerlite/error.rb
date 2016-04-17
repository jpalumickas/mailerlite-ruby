module MailerLite
  class Error < StandardError
    # Returns the appropriate MailerLite::Error sublcass based
    # on status and response message.
    #
    # response - The Hash of HTTP response.
    #
    # Returns the MailerLite::Error.
    def self.from_response(response)
      status = response[:status].to_i

      klass = case status
              when 400 then MailerLite::BadReques
              when 401 then MailerLite::Unauthorized
              when 404 then MailerLite::NotFound
              end

      klass.new if klass
    end
  end

  # Raised when MailerLite returns a 400 HTTP status code
  class BadRequest < Error
    def to_s
      'Missing a required parameter or calling invalid method'
    end
  end

  # Raised when MailerLite returns a 401 HTTP status code
  class Unauthorized < Error
    def to_s
      'Invalid API key provided'
    end
  end

  # Raised when MailerLite returns a 404 HTTP status code
  class NotFound < Error
    def to_s
      "Can't find requested items"
    end
  end
end
