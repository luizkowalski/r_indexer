FactoryBot.define do
  factory :version do
    version '0.0.1'
    package { create(:package) }
  end
end
