require 'spec_helper'

describe MailerLite::Configuration do
  let(:config) { MailerLite::Configuration.new }
  let(:version) { MailerLite::VERSION }

  describe '#url' do
    it 'has correct default value' do
      expect(config.url).to eq('https://app.mailerlite.com/api/v1')
    end

    it 'has correct custom value' do
      config.url = 'test_url'
      expect(config.url).to eq('test_url')
    end
  end

  describe '#user_agent' do
    it 'has correct value' do
      expect(config.user_agent).to eq("MailerLite Ruby v#{version}")
    end

    it 'has correct custom value' do
      config.user_agent = 'My user agent'
      expect(config.user_agent).to eq('My user agent')
    end
  end
end
