require 'spec_helper'

describe MailerLite::Clients::Subscribers do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#subscribers' do
    before { stub_get_command('subscribers', 'subscribers/list') }

    let(:response) { client.subscribers }

    it 'has correct first subscriber email' do
      expect(response[0].email).to eq('demo@mailerlite.com')
    end
  end

  describe '#subscriber' do
    before do
      stub_get_command(
        'subscribers/demo@mailerlite.com', 'subscribers/show'
      )
    end

    let(:response) { client.subscriber('demo@mailerlite.com') }

    it 'has correct subscriber email' do
      expect(response.email).to eq('demo@mailerlite.com')
    end
  end

  describe '#create_subscriber' do
    before do
      stub_post_command(
        'subscribers', 'subscribers/create',
        email: 'demo@mailerlite.com', name: 'John'
      )
    end

    let(:response) do
      client.create_subscriber(
        email: 'demo@mailerlite.com',
        name: 'John'
      )
    end

    it 'has correct subscriber email' do
      expect(response.email).to eq('demo@mailerlite.com')
    end

    it 'has correct subscriber name' do
      expect(response.name).to eq('John')
    end
  end

  describe '#update_subscriber' do
    before do
      stub_put_command(
        'subscribers/demo@mailerlite.com', 'subscribers/update',
        type: 'unsubscribed'
      )
    end

    let(:response) do
      client.update_subscriber('demo@mailerlite.com', type: 'unsubscribed')
    end

    it 'has correct subscriber email' do
      expect(response.email).to eq('demo@mailerlite.com')
    end

    it 'has correct subscriber type' do
      expect(response.type).to eq('unsubscribed')
    end
  end

  describe '#delete_subscriber' do
    before do
      stub_delete(
        'subscribers/demo@mailerlite.com',
        return_options: { status: status_code }
      )
    end

    subject(:response) do
      client.delete_subscriber('demo@mailerlite.com')
    end

    context 'when identifier exists' do
      let(:status_code) { 204 }

      it 'returns true' do
        expect(response).to be true
      end
    end

    context 'when identifier does not exists' do
      let(:status_code) { 404 }

      it 'returns false' do
        expect { response }.to raise_error(MailerLite::NotFound)
      end
    end
  end

  describe '#search_subscribers' do
    before do
      stub_get_command(
        'subscribers/search', 'subscribers/search',
        query: 'demo@mailerlite.com'
      )
    end

    let(:response) do
      client.search_subscribers('demo@mailerlite.com')
    end

    it 'has correct first subscriber email' do
      expect(response.first.email).to eq('demo@mailerlite.com')
    end
  end

  describe '#subscriber_groups' do
    before do
      stub_get_command(
        'subscribers/demo@mailerlite.com/groups', 'subscribers/groups'
      )
    end

    let(:response) { client.subscriber_groups('demo@mailerlite.com') }

    it 'has correct subscriber first group name' do
      expect(response.first.name).to eq('Main List')
    end
  end

  describe '#subscriber_activities' do
    before do
      stub_get_command(
        'subscribers/demo@mailerlite.com/activity', 'subscribers/activity'
      )
    end

    let(:response) { client.subscriber_activities('demo@mailerlite.com') }

    it 'has correct subscriber first avtivity subject' do
      expect(response.first.subject).to eq('Demo Campaign #4')
    end

    it 'has correct alias method' do
      expect(client.subscriber_activity('demo@mailerlite.com')).to eq(response)
    end
  end
end
