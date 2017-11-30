require 'open-uri'
require 'zlib'

class PackageParser
  class << self
    def parse(package, version)
      Version.find_or_create_by(package: package, version: version)
    end
    
    # private
    
    def load_file(package)
      source = open(package.external_address)
      destination = "/tmp/#{package.name}.tar.gz"

      IO.copy_stream(source, destination)
      gz = Zlib::GzipReader.new(open(destination)) 
      description_file = gz.entries.select { |e| e.full_name == 'DESCRIPTION' }
      byebug
    end
  end
end
