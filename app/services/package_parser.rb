require 'open-uri'
require 'zlib'
require 'dcf'

# reload! && PackageParser.parse(Package.last, Package.last.latest_version)
class PackageParser
  extend Extractable

  AUTHORS_REGEX = /\[[^\]]*\]/ # remove [] from authors list
  class << self
    def parse(package, ver)
      version = Version.find_or_create_by(package: package, version: ver)
      # return Rails.logger.info "Version already processed" if version.processed?
      package.download
      description = extract_description(package)

      update_package(package, description)
      update_version(version, description)
      update_authors(package, description)
      update_maintainers(package, description)

      package.save!
    end
    
    private
    
    def update_package(package, description)
      package.update title: description['Title'], description: description['Description']
    end
    
    def update_authors(package, description)
      extract_authors(description).each do |author|
        package.authors << author unless package.authors.include? author
      end
    end
  
    def update_maintainers(package, description)
      maintainer = extract_maintainer(description)
      package.maintainers << maintainer unless package.maintainers.include? maintainer
    end
    
    def update_version(version, description)
      version.update published_at: description['Date/Publication']
    end
  end
end
