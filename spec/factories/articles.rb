FactoryGirl.define do
  factory :article do
    title
    subtitle { Faker::HarryPotter.quote }
    text
    user
  end
end
