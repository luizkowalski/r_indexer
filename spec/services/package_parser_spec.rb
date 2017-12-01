require 'rails_helper'

describe PackageParser do
  describe 'parse' do
    context 'a new package' do
      let(:package) { create(:package) }
      let(:ver) { '1.0.0' }
      let(:version) { create(:version, :unprocessed, version: ver, package: package) }
      subject do
        described_class.parse(package, ver)
      end

      it 'version should be processed' do
        expect do
          subject
        end.to change { version.reload.processed? }
      end
      
      it 'package should have author' do
        expect do
          subject
        end.to change { package.authors.count }
      end
      
      it 'package should have maintainer' do
        expect do
          subject
        end.to change { package.maintainers.count }
      end
    end

    context 'a new version from an existing package' do
      let(:package) { create(:package, :with_old_version) }
      let(:new_version) { '1.0.0' }
      subject do
        described_class.parse(package, new_version)
      end

      it 'it should create a new version for the package' do
        expect do
          subject
        end.to change { package.versions.count }
      end
    end
  end
end
