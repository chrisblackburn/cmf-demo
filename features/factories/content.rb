FactoryGirl.define do
  factory :content do
    title { Faker::Name.name }
    content { Faker::Lorem.sentence(3) }
    approved_at nil
  end
end
