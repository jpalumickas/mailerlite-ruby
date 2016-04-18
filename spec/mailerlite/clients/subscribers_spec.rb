require 'spec_helper'

describe MailerLite::Clients::Subscribers do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#create_subscriber' do
    before do
      stub_post_command(
        'subscribers/123', 'subscribers/add', email: 'first@example.com')
    end

    let(:response) { client.create_subscriber(123, 'first@example.com') }

    it 'has correct response email' do
      expect(response.email).to eq('first@example.com')
    end
  end

  describe '#create_subscribers' do
    let(:options) { { subscribers: [{ email: 'first@example.co' }] } }
    before do
      stub_post_command(
        'subscribers/123/import', 'subscribers/import', options)
    end

    let(:response) { client.create_subscribers(123, options) }

    it 'has correct results count' do
      expect(response.results.count).to eq(2)
    end

    it 'has correct result email' do
      expect(response.results.first.email).to eq('first@example.co')
    end

    it 'has correct result message' do
      expect(response.results.first.message).to eq('Wrong email address')
    end
  end

  describe '#subscriber' do
    before do
      stub_get_command(
        'subscribers', 'subscribers/details', email: 'first@example.com')
    end

    let(:response) { client.subscriber('first@example.com') }

    it 'has correct response email' do
      expect(response.email).to eq('first@example.com')
    end
  end

  describe '#delete_subscriber' do
    before do
      stub_delete_command(
        'subscribers/123', 'subscribers/delete', email: 'first@example.com')
    end

    let(:response) { client.delete_subscriber(123, 'first@example.com') }

    it 'has correct response'
    # TODO: Waiting for MailerLite response fix.
    # expect(response).to eq('first@example.com')
  end

  describe '#unsubscribe_subscriber' do
    before do
      stub_post_command(
        'subscribers/unsubscribe', 'subscribers/unsubscribe',
        email: 'first@example.com')
    end

    let(:response) { client.unsubscribe_subscriber('first@example.com') }

    it 'has correct response'
    # TODO: Waiting for MailerLite response fix.
    # expect(response).to eq('first@example.com')
  end
end
