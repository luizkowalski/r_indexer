require 'open-uri'

class IndexParser
  INDEX = "#{PACKAGE_SITE}/PACKAGES".freeze
  class << self
    def start
      package = open(INDEX).read
      parsed_packages = parse(package)
      parsed_packages.each do |p|
        package = Package.find_or_create_by(name: p['Package'])
        PackageParserJob.perform_async(package.id, p['Version'])
      end
    end

    private

    def parse(input)
      input.split("\n\n").collect { |package| YAML.load(package) }.take(50)
    end
  end
end
