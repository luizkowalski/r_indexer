class Package < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :maintainer
  has_many :versions
  
  def external_address
    "#{PACKAGE_SITE}/#{name}_#{latest_version}.tar.gz"
  end
  
  def latest_version
    versions.last.version
  end
end
