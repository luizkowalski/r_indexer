class PackageParserJob
  include Sidekiq::Worker

  def perform(package_id, version)
    PackageParser.parse(Package.find(package_id), version)
  end
end
