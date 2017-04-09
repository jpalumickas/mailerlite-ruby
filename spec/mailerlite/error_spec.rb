require 'spec_helper'

describe MailerLite::Error do
  describe '.from_response' do
    it 'has bad request error raised when status is 400' do
      response = double(status: 400, body: [])
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(
          MailerLite::BadRequest,
          'Missing a required parameter or calling invalid method'
        )
    end

    it 'has unauthorized error raised when status is 401' do
      response = double(status: 401, body: [])
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(MailerLite::Unauthorized, 'Invalid API key provided')
    end

    it 'has not found error raised when status is 404' do
      response = double(status: 404, body: [])
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(MailerLite::NotFound, "Can't find requested items")
    end

    it 'has internal server error raised when status is 500' do
      response = double(status: 500, body: [])
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(
          MailerLite::InternalServerError,
          'The server encountered an unexpected condition'
        )
    end

    it 'has correct error message from response' do
      response = double(
        status: 500,
        body: { 'error' => { 'message' => 'TEST' } }
      )
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(
          MailerLite::InternalServerError,
          'TEST'
        )
    end

    it 'has correct error message when response error is blank' do
      response = double(
        status: 500,
        body: { 'error' => { 'message' => '' } }
      )
      expect { raise MailerLite::Error.from_response(response) }
        .to raise_error(
          MailerLite::InternalServerError,
          'The server encountered an unexpected condition'
        )
    end
  end
end
