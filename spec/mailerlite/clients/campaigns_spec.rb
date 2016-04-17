require 'spec_helper'

describe MailerLite::Clients::Campaigns do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#campaigns' do
    before do
      stub_get_command('campaigns', 'campaigns/all')
    end

    let(:response) { client.campaigns }

    it 'has correct results count' do
      expect(response.results.count).to eq(2)
    end

    it 'has correct first result name' do
      expect(response.results.first.name).to eq('My first campaign')
    end
  end

  describe '#campaign' do
    before do
      stub_get_command('campaigns/3096', 'campaigns/details')
    end

    let(:response) { client.campaign(3096) }

    it 'has correct id' do
      expect(response.id).to eq('3096')
    end

    it 'has correct name' do
      expect(response.name).to eq('My first campaign')
    end
  end

  describe '#campaign_recipients' do
    before do
      stub_get_command('campaigns/3096/recipients', 'campaigns/recipients')
    end

    let(:response) { client.campaign_recipients(3096) }

    it 'has correct results count' do
      expect(response.results.count).to eq(3)
    end

    it 'has correct first result email' do
      expect(response.results.first.email).to eq('first@example.com')
    end
  end

  describe '#campaign_opens' do
    before do
      stub_get_command('campaigns/3096/opens', 'campaigns/opens')
    end

    let(:response) { client.campaign_opens(3096) }

    it 'has correct results count' do
      expect(response.results.count).to eq(3)
    end

    it 'has correct first result email' do
      expect(response.results.first.email).to eq('first@example.com')
    end
  end

  describe '#campaign_clicks' do
    before do
      stub_get_command('campaigns/3096/clicks', 'campaigns/clicks')
    end

    let(:response) { client.campaign_clicks(3096) }

    it 'has correct results count' do
      expect(response.results.count).to eq(3)
    end

    it 'has correct first result email' do
      expect(response.results.first.email).to eq('first@example.com')
    end
  end

  describe '#campaign_unsubscribes' do
    before do
      stub_get_command('campaigns/3096/unsubscribes', 'campaigns/unsubscribes')
    end

    let(:response) { client.campaign_unsubscribes(3096) }

    it 'has correct results count' do
      expect(response.results.count).to eq(3)
    end

    it 'has correct first result email' do
      expect(response.results.first.email).to eq('first@example.com')
    end
  end

  describe '#campaign_bounces' do
    before do
      stub_get_command('campaigns/3096/bounces', 'campaigns/bounces')
    end

    let(:response) { client.campaign_bounces(3096) }

    it 'has correct results count' do
      expect(response.results.count).to eq(2)
    end

    it 'has correct first result email' do
      expect(response.results.first.email).to eq('first@example5.co')
    end
  end

  describe '#campaign_junk' do
    before do
      stub_get_command('campaigns/3096/junk', 'campaigns/junk')
    end

    let(:response) { client.campaign_junk(3096) }

    it 'has correct results count' do
      expect(response.results.count).to eq(2)
    end

    it 'has correct first result email' do
      expect(response.results.first.email).to eq('first@example.com')
    end

    it 'has correct alias method' do
      expect(client.campaign_spam_complaints(3096)).to eq(response)
    end
  end
end
