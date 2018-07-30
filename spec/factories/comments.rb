FactoryGirl.define do
  factory :comment do
    user
    article
    text { Faker::VForVendetta.quote }
  end
end
