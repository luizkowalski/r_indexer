require 'rails_helper'

describe PackageParser do
  describe 'parse' do
    context 'a new package' do
      let(:package) { create(:package) }
      let(:ver) { '2.1' }
      let(:version) { create(:version, :unprocessed, version: ver, package: package) }
      subject do
        described_class.parse(package, ver)
      end

      it 'version should be processed' do
        VCR.use_cassette('package_parser/parse') do
          expect do
            subject
          end.to change { version.reload.processed? }
        end
      end

      it 'package should have author' do
        VCR.use_cassette('package_parser/parse') do
          expect do
            subject
          end.to change { package.authors.count }
        end
      end

      it 'package should have maintainer' do
        VCR.use_cassette('package_parser/parse') do
          expect do
            subject
          end.to change { package.maintainers.count }
        end
      end
    end

    context 'a new version from an existing package' do
      let(:package) { create(:package, :with_old_version) }
      let(:new_version) { '2.1' }
      subject do
        described_class.parse(package, new_version)
      end

      it 'it should create a new version for the package' do
        VCR.use_cassette('package_parser/parse') do
          expect do
            subject
          end.to change { package.versions.count }
        end
      end

      it 'it should have a new latest_version' do
        VCR.use_cassette('package_parser/parse') do
          expect do
            subject
          end.to change { package.reload.latest_version }
        end
      end
    end
  end
end
