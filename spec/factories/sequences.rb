FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { |n| "#{Faker::Lorem.words} #{n}" }
  sequence(:text) { Faker::Lorem.paragraph }
end
