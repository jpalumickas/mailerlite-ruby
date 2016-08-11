require 'spec_helper'

describe MailerLite do
  it 'has a version number' do
    expect(MailerLite::VERSION).not_to be nil
  end

  it 'has a client class' do
    expect(MailerLite.client).to be_a(MailerLite::Client)
  end

  it 'responds to config' do
    expect(MailerLite.respond_to?(:config)).to be_truthy
  end

  context 'configuration' do
    before do
      MailerLite.configure do |config|
        config.api_key = 'testing'
      end
    end

    it 'has correct api key' do
      expect(MailerLite.config.api_key).to eq('testing')
    end
  end
end
