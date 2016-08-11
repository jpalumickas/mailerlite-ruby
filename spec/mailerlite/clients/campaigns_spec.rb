require 'spec_helper'

describe MailerLite::Clients::Campaigns do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#create_campaign' do
    before do
      stub_post_command(
        'campaigns', 'campaigns/create', type: 'regular', groups: [1]
      )
    end

    let(:response) { client.create_campaign(type: 'regular', groups: [1]) }

    it 'has correct campaign type' do
      expect(response.campaign_type).to eq('regular')
    end
  end

  describe '#update_campaign_content' do
    before do
      stub_put_command(
        'campaigns/1/content', 'campaigns/update_content',
        html: 'html', plain: 'plain'
      )
    end

    let(:response) do
      client.update_campaign_content(1, html: 'html', plain: 'plain')
    end

    it 'has correct campaign type' do
      expect(response.success).to eq(true)
    end
  end

  describe '#campaign_action' do
    before do
      stub_post_command('campaigns/1/actions/send', 'campaigns/action')
    end

    let(:response) do
      client.campaign_action(1, 'send')
    end

    it 'has correct campaign id' do
      expect(response.id).to eq(2_418_787)
    end
  end
end
