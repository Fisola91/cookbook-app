FactoryBot.define do
  factory :random_recipe, class: Recipe do
    name { Faker::Food.ingredient }
    description { Faker::Food.description }
    completed { "nil" }
  end
end
