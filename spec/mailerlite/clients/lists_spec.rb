require 'spec_helper'

describe MailerLite::Clients::Lists do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#lists' do
    before do
      stub_get_command('lists', 'lists/all')
    end

    it 'has correct results count' do
      expect(client.lists.results.count).to eq(2)
    end

    it 'has correct first result name' do
      expect(client.lists.results.first.name).to eq('My list')
    end
  end

  describe '#list' do
    before do
      stub_get_command('lists/11', 'lists/details')
    end

    it 'has correct result id' do
      expect(client.list(11).id).to eq('11')
    end

    it 'has correct result name' do
      expect(client.list(11).name).to eq('My list')
    end
  end

  describe '#create_list' do
    before do
      stub_post_command('lists', 'lists/add', name: 'My new list')
    end

    let(:response) { client.create_list('My new list') }

    it 'has correct result id' do
      expect(response.id).to eq('11')
    end

    it 'has correct result name' do
      expect(response.name).to eq('My new list')
    end
  end

  describe '#update_list' do
    before do
      stub_post_command('lists/11', 'lists/update', name: 'My another list')
    end

    let(:response) { client.update_list(11, 'My another list') }

    it 'has correct result id' do
      expect(response.id).to eq('11')
    end

    it 'has correct result name' do
      expect(response.name).to eq('My another list')
    end
  end

  describe '#delete_list' do
    before do
      stub_delete_command('lists/11', 'lists/remove')
    end

    let(:response) { client.delete_list(11) }

    it 'has not any error' do
      expect { response }.to_not raise_error
    end

    it 'has correct response' do
      expect(response).to eq({})
    end
  end

  describe '#list_active_subscribers' do
    before do
      stub_get_command('lists/11/active', 'lists/active_subscribers')
    end

    let(:response) { client.list_active_subscribers(11) }

    it 'has correct results count' do
      expect(response.results.count).to eq(2)
    end

    it 'has correct result email' do
      expect(response.results.first.email).to eq('first@example.com')
    end
  end

  describe '#list_unsubscribed_subscribers' do
    before do
      stub_get_command(
        'lists/11/unsubscribed',
        'lists/unsubscribed_subscribers')
    end

    let(:response) { client.list_unsubscribed_subscribers(11) }

    it 'has correct results count' do
      expect(response.results.count).to eq(2)
    end

    it 'has correct result email' do
      expect(response.results.first.email).to eq('adam@example.com')
    end
  end

  describe '#list_bounced_subscribers' do
    before do
      stub_get_command('lists/11/bounced', 'lists/bounced_subscribers')
    end

    let(:response) { client.list_bounced_subscribers(11) }

    it 'has correct results count' do
      expect(response.results.count).to eq(2)
    end

    it 'has correct result email' do
      expect(response.results.first.email).to eq('one@example.com')
    end
  end
end
