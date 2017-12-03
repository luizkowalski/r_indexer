class AllPackagesQuery
  class << self
    def call
      Package.includes(:authors, :versions, :maintainers).all.order('name asc').distinct
    end
  end
end
