FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    factory :invalid_category do
      name { "" }
    end
  end
end
