class Version < ApplicationRecord
  belongs_to :package
  
  def processed?
    published_at.present?
  end
end
