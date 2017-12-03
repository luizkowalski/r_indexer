require 'rails_helper'

describe PackagePresenter do
  context 'all packages' do
    let(:package) { create(:package, :full_package) }
    subject do
      packages = described_class.present([package])
      packages.first
    end

    it 'return the title' do
      expect(subject[:title]).to be_eql package.title
    end

    it 'return the latest version' do
      expect(subject[:latest_version]).to be_eql package.latest_version
    end

    it 'return the authors array' do
      expect(subject[:authors]).not_to be_empty
    end

    it 'return the maintainers array' do
      expect(subject[:maintainers]).not_to be_empty
    end
  end
end
