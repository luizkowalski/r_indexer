require 'open-uri'
require 'zlib'
require 'dcf'

# reload! && PackageParser.parse(Package.last, Package.last.latest_version)
class PackageParser
  class << self
    def parse(package, ver)
      version = Version.find_or_create_by(package: package, version: ver)
      # return Rails.logger.info "Version already processed" if version.processed?
      download_file(package)
      hash_description = read_desc_file(package)
      # update_package(package, hash_description)
      # update_version(version, hash_description)
      update_authors(package, hash_description)
      update_maintainers(package, hash_description)
    end
    
    private
    
    def update_package(package, hash_description)
      package.update title: hash_description['Title'], description: hash_description['Description']
    end
    
    def update_authors(package, hash_description)
      authors = hash_description['Author']
      puts authors
      puts authors.gsub(/\[[^\]]*\]/, '').split(', ')
    end
    def update_maintainers(package, hash_description)
      puts "Maintainer: #{hash_description['Maintainer']}"
    end
    
    def update_version(version, hash_description)
      version.update published_at: hash_description['Date/Publication']
    end
    
    def download_file(package)
      source = open(package.external_address)
      IO.copy_stream(source, package.tmp_file)
    end
    
    def read_desc_file(package)
      gz = Zlib::GzipReader.new(open(package.tmp_file)) 
      reader = Minitar::Reader.new(gz)
      raw_description = reader.each_entry.find { |f| f.name.match? /DESCRIPTION/ }.read
      Dcf.parse(raw_description).first
    end
  end
end
