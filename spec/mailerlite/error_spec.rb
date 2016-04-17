require 'spec_helper'

describe MailerLite::Error do
  describe '.from_response' do
    it 'has bad request error raised when status is 400' do
      response = { status: 400 }
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(
          MailerLite::BadRequest,
          'Missing a required parameter or calling invalid method')
    end

    it 'has unauthorized error raised when status is 401' do
      response = { status: 401 }
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(MailerLite::Unauthorized, 'Invalid API key provided')
    end

    it 'has not found error raised when status is 404' do
      response = { status: 404 }
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(MailerLite::NotFound, "Can't find requested items")
    end
  end
end
