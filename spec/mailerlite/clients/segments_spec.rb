require 'spec_helper'

describe MailerLite::Clients::Segments do
  let(:client) { MailerLite::Client.new(api_key: 'test_key') }

  describe '#segments' do
    before do
      stub_get_command('segments', 'segments/list')
    end

    it 'has correct data title' do
      expect(client.segments.data.first.title).to eq('Segment 1')
    end
  end
end
