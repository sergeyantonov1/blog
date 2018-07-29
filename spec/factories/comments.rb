FactoryGirl.define do
  factory :comment do
    user
    article
    text
  end
end
