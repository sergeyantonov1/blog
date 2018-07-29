after "development:users" do
  User.all.each do |user|
    FactoryGirl.create_list(:article, 5, user: user)
  end
end
