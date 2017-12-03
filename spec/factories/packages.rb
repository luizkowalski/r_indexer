FactoryBot.define do
  factory :package do
    name 'abc'
    title 'test package'

    trait :with_old_version do
      after(:create) do |package|
        create_list(:version, 1, package: package, version: '0.0.1')
      end
    end

    trait :full_package do
      before(:create) do |package|
        create(:version, package: package)
        package.authors = [create(:author)]
        package.maintainers = [create(:maintainer)]
      end
    end
  end
end
