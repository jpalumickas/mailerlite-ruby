require 'spec_helper'

describe MailerLite::Clients::Fields do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#fields' do
    before do
      stub_get_command('fields', 'fields/list')
    end

    let(:response) { client.fields }

    it 'has correct fields count' do
      expect(response.count).to eq(10)
    end

    it 'has correct first field title' do
      expect(response.first.title).to eq('Name')
    end
  end

  describe '#create_field' do
    before do
      stub_post_command(
        'fields', 'fields/create', title: 'Favourite Color', type: 'TEXT'
      )
    end

    let(:response) do
      client.create_field(title: 'Favourite Color', type: 'TEXT')
    end

    it 'has correct field title' do
      expect(response.title).to eq('Favourite Color')
    end

    it 'has correct field type' do
      expect(response.type).to eq('TEXT')
    end
  end

  describe '#update_field' do
    before do
      stub_put_command(
        'fields/1', 'fields/update', title: 'Favourite Color'
      )
    end

    let(:response) do
      client.update_field(1, title: 'Favourite Color')
    end

    it 'has correct field title' do
      expect(response.title).to eq('Favourite Color')
    end
  end

  describe '#delete_field' do
    before do
      stub_delete_command('fields/1', 'fields/delete')
    end

    let(:response) { client.delete_field(1) }

    it 'has not any error' do
      expect { response }.to_not raise_error
    end

    it 'has correct response' do
      expect(response).to be_nil
    end
  end
end
