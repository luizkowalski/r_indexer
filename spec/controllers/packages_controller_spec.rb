require 'rails_helper'

RSpec.describe PackagesController, type: :controller do
  describe 'GET #index' do
    context 'with packages' do
      before(:each) do
        create_list(:package, 10, :full_package)
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'returns all packages' do
        get :index
        packages = assigns(:packages)
        expect(packages.size).to be_eql Package.count
      end
    end
  end
end
