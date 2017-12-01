FactoryBot.define do
  factory :package do
    name 'abc'
    title 'test package'
    
    trait :with_version do
      after(:create) do |package|
        create_list(:version, 1, package: package)
      end
    end
    
    trait :with_old_version do
      after(:create) do |package|
        create_list(:version, 1, package: package, version: '0.0.1')
      end
    end
  end
end
