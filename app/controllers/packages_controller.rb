class PackagesController < ApplicationController
  def index
    @packages = Package.joins(:authors).joins(:versions).joins(:maintainers)
  end
end
