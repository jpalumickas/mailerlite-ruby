require 'spec_helper'

describe MailerLite::Configuration do
  let(:config) { MailerLite::Configuration.new }
  let(:version) { MailerLite::VERSION }

  describe '#url' do
    it 'has correct value' do
      expect(config.url).to eq('https://app.mailerlite.com/api/v1')
    end
  end

  describe '#user_agent' do
    it 'has correct value' do
      expect(config.user_agent).to eq("MailerLite Ruby v#{version}")
    end
  end
end
