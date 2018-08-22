FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { Faker::Simpsons.character }
  sequence(:text) { Faker::VForVendetta.speech }
  sequence(:word) { Faker::Lorem.word }
end
