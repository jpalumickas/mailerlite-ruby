require 'spec_helper'

describe MailerLite::Clients::Account do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#account' do
    before do
      stub_get_command('me', 'account/me')
    end

    let(:response) { client.account }

    it 'has correct email' do
      expect(response.email).to eq('dummy@mailerlite.com')
    end
  end

  describe '#stats' do
    before do
      stub_get_command('stats', 'account/stats')
    end

    let(:response) { client.stats }

    it 'has correct subscribed count' do
      expect(response.subscribed).to eq(10_187)
    end
  end
end
