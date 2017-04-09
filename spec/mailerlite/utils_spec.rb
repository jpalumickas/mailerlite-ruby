require 'spec_helper'

describe MailerLite::Utils do
  describe '.underscore' do
    it 'has converted string to underscore' do
      expect(described_class.underscore('MySuperKey')).to eq('my_super_key')
    end
  end

  describe '.blank?' do
    it 'has truthy value when value is blank' do
      expect(described_class.blank?('    ')).to be_truthy
    end

    it 'has truthy value when value is empty array' do
      expect(described_class.blank?([])).to be_truthy
    end

    it 'has truthy value when value nil' do
      expect(described_class.blank?(nil)).to be_truthy
    end

    it 'has falsey value when value is not blank' do
      expect(described_class.blank?('    Test')).to be_falsey
    end
  end

  describe '.present?' do
    it 'has falsey value when value is blank' do
      expect(described_class.present?('    ')).to be_falsey
    end

    it 'has truthy value when value is not blank' do
      expect(described_class.present?('    Test')).to be_truthy
    end
  end

  describe '.presence' do
    it 'has nil value when value is blank' do
      expect(described_class.presence('    ')).to be_nil
    end

    it 'has same value when value is not blank' do
      expect(described_class.presence(' Test ')).to eq(' Test ')
    end
  end
end
