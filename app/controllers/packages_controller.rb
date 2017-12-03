class PackagesController < ApplicationController
  def index
    @packages = PackagePresenter.present(AllPackagesQuery.call)
  end
end
