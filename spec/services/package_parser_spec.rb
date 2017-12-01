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
        VCR.use_cassette('package_parser/package') do
          expect do
            subject
          end.to change { version.reload.processed? }
        end
      end
    end
  end
end
