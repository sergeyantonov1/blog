FactoryGirl.define do
  factory :comment do
    user
    article
    text Faker::Lorem.paragraph(3)
  end
end
