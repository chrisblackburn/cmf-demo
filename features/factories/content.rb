FactoryGirl.define do
  factory :content do
    title { Faker::Name.name }
    content '{"data":[{"type":"heading","data":{"text":"Test"}}]}'
    approved_at nil
  end
end
