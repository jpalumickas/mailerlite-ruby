require 'spec_helper'

describe MailerLite::Clients::Subscribers do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#create_subscriber' do
    before do
      stub_post_command(
        'subscribers/123', 'subscribers/add', email: 'first@example.com')
    end

    let(:response) { client.create_subscriber(123, 'first@example.com') }

    it 'has correct response email' do
      expect(response.email).to eq('first@example.com')
    end
  end
end
