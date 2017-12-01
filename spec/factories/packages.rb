FactoryBot.define do
  factory :package do
    name 'abc'
    title 'test package'
    
    trait :with_version do
      after(:create) do |package|
        create_list(:version, 1, package: package)
      end
    end
  end
end
