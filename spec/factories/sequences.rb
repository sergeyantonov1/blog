FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { Faker::Lorem.sentence }
  sequence(:text) { Faker::Lorem.paragraph(30) }
end
