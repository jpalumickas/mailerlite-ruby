require 'spec_helper'

describe MailerLite::Client do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#config' do
    it 'has Configuration class' do
      expect(client.config).to be_a(MailerLite::Configuration)
    end

    it 'has correct alias method' do
      expect(client.config).to eq(client.configuration)
    end
  end

  describe '#connection' do
    it 'has Connection class' do
      expect(client.connection).to be_a(MailerLite::Connection)
    end
  end

  describe '#configure' do
    before do
      client.configure do |config|
        config.api_key = 'new_key'
      end
    end

    it 'has correct api key' do
      expect(client.config.api_key).to eq('new_key')
    end
  end
end
