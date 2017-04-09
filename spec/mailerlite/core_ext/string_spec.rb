require 'spec_helper'

describe String do
  describe '.underscore' do
    it 'has converted string to underscore' do
      expect('MySuperKey'.underscore).to eq('my_super_key')
    end
  end

  describe '.blank?' do
    it 'has truthy value when value is blank' do
      expect('    '.blank?).to be_truthy
    end

    it 'has falsey value when value is not blank' do
      expect('    Test'.blank?).to be_falsey
    end
  end
end
