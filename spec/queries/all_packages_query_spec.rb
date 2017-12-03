require 'rails_helper'

describe AllPackagesQuery do
  context 'all packages' do
    before do
      create_list(:package, 10, :full_package)
    end

    it 'should return all packages' do
      expect(described_class.call.size).to be_eql 10
    end
  end
end
