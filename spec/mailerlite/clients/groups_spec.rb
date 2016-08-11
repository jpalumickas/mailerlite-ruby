require 'spec_helper'

describe MailerLite::Clients::Groups do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#groups' do
    before do
      stub_get_command('groups', 'groups/list')
    end

    it 'has correct results count' do
      expect(client.groups.count).to eq(2)
    end

    it 'has correct first group name' do
      expect(client.groups.first.name).to eq('Demo API v2 List')
    end
  end

  describe '#group' do
    before do
      stub_get_command('groups/3640549', 'groups/group')
    end

    it 'has correct result id' do
      expect(client.group(3_640_549).id).to eq(3_640_549)
    end

    it 'has correct result name' do
      expect(client.group(3_640_549).name).to eq('Demo API v2 List')
    end
  end

  describe '#create_group' do
    before do
      stub_post_command('groups', 'groups/create', name: 'Demo Group')
    end

    let(:response) { client.create_group('Demo Group') }

    it 'has correct group name' do
      expect(response.name).to eq('Demo Group')
    end
  end

  describe '#update_group' do
    before do
      stub_put_command('groups/1', 'groups/update', name: 'Renamed Group')
    end

    let(:response) { client.update_group(1, name: 'Renamed Group') }

    it 'has correct result id' do
      expect(response.id).to eq(1)
    end

    it 'has correct result name' do
      expect(response.name).to eq('Renamed Group')
    end
  end

  describe '#delete_group' do
    before do
      stub_delete_command('groups/1', 'groups/delete')
    end

    let(:response) { client.delete_group(1) }

    it 'has not any error' do
      expect { response }.to_not raise_error
    end

    it 'has correct response' do
      expect(response).to eq({})
    end
  end

  describe '#group_subscribers' do
    before do
      stub_get_command('groups/1/subscribers', 'groups/subscribers')
    end

    let(:response) { client.group_subscribers(1) }

    it 'has correct results count' do
      expect(response.count).to eq(2)
    end

    it 'has correct result email' do
      expect(response.first.email).to eq('demo@mailerlite.com')
    end
  end

  describe '#create_group_subscriber' do
    before do
      stub_post_command(
        'groups/1/subscribers', 'groups/create_subscriber',
        email: 'demo@mailerlite.com'
      )
    end

    let(:response) do
      client.create_group_subscriber(1, email: 'demo@mailerlite.com')
    end

    it 'has correct result email' do
      expect(response.email).to eq('demo@mailerlite.com')
    end
  end

  describe '#import_group_subscribers' do
    before do
      stub_post_command(
        'groups/1/subscribers/import', 'groups/import_subscribers',
        resubscribe: true, subscribers: []
      )
    end

    let(:response) do
      client.import_group_subscribers(1, [], resubscribe: true)
    end

    it 'has correct result email' do
      expect(response.imported.first.email).to eq('another.demo@mailerlite.com')
    end
  end

  describe '#delete_group_subscriber' do
    before do
      stub_delete_command(
        'groups/1/subscribers/demo@mailerlite.com', 'groups/delete_subscriber'
      )
    end

    let(:response) do
      client.delete_group_subscriber(1, 'demo@mailerlite.com')
    end

    it 'has not any error' do
      expect { response }.to_not raise_error
    end

    it 'has correct response' do
      expect(response).to eq({})
    end
  end
end
