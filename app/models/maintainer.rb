class Maintainer < ApplicationRecord
  has_and_belongs_to_many :packages
end
