class AllPackagesQuery
  class << self
    def call
      Package.joins(:authors).joins(:versions).joins(:maintainers).order('name asc').distinct
    end
  end
end
