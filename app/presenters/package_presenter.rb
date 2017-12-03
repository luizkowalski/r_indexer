class PackagePresenter
  class << self
    def present(packages)
      packages.map { |package| present_package(package) }
    end

    private

    def present_package(package)
      {
        name: package.name,
        title: package.title,
        description: package.description,
        authors: package.authors.map(&:name).join(', '),
        maintainers: package.maintainers.map { |m| "#{m.name} (#{m.email})" }.join(', '),
        latest_version: package.latest_version,
        link: package.external_address
      }
    end
  end
end
