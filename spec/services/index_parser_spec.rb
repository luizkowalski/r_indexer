require 'rails_helper'

describe IndexParser do
  describe 'start' do
    context 'when parsing the file' do
      subject do
        described_class.start
      end

      it 'should create new packages' do
        VCR.use_cassette('index_parser/package_file') do
          expect { subject }.to change(Package, :count)
        end
      end
    end
  end
end
