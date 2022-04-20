FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    description {Faker::Lorem.paragraph}
    factory :invalid_category do
      name { "" }
      description { "" }
    end
  end
end
