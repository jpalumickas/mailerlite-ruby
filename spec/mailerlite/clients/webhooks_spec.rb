require 'spec_helper'

describe MailerLite::Clients::Webhooks do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#webhooks' do
    before do
      stub_get_command('webhooks', 'webhooks/list')
    end

    let(:response) { client.webhooks }

    it 'has correct webhooks count' do
      expect(response[:count]).to eq(2)
    end

    it 'has correct first webhook title' do
      expect(response.webhooks.first.event).to eq('subscriber.create')
    end
  end

  describe '#webhook' do
    before do
      stub_get_command('webhooks/1', 'webhooks/show')
    end

    let(:response) { client.webhook(1) }

    it 'has correct first webhook title' do
      expect(response.event).to eq('subscriber.create')
    end
  end

  describe '#create_webhook' do
    before do
      stub_post_command(
        'webhooks', 'webhooks/create', url: 'example.com', event: 'Test'
      )
    end

    let(:response) do
      client.create_webhook('example.com', 'Test')
    end

    it 'has correct webhook id' do
      expect(response.id).to eq(7)
    end
  end

  describe '#update_webhook' do
    before do
      stub_put_command(
        'webhooks/1', 'webhooks/update', event: 'new_event'
      )
    end

    let(:response) do
      client.update_webhook(1, event: 'new_event')
    end

    it 'has correct field title' do
      expect(response.id).to eq(1)
    end
  end

  describe '#delete_webhook' do
    before do
      stub_delete_command('webhooks/1', 'webhooks/delete')
    end

    let(:response) { client.delete_webhook(1) }

    it 'has not any error' do
      expect { response }.to_not raise_error
    end

    it 'has correct response' do
      expect(response).to eq('success' => true)
    end
  end
end
