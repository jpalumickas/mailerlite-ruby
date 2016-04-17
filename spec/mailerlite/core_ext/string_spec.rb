require 'spec_helper'

describe String do
  describe '.underscore' do
    it 'has converted string to underscore' do
      expect('MySuperKey'.underscore).to eq('my_super_key')
    end
  end
end
