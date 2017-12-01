FactoryBot.define do
  factory :version do
    version '0.0.1'
    package { create(:package) }
    published_at Time.zone.now
    
    trait :unprocessed do
      published_at nil
    end
  end
end
