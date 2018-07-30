puts "=> Seeding started"

start_time = Time.current

all_users = FactoryGirl.create_list(:user, 10)

20.times do
  user = all_users.sample(1).first

  FactoryGirl.create(:article, user: user)
end

articles = Article.all

articles.each do |article|
  random_users = all_users.sample(rand(1..10))

  random_users.each do |user|
    FactoryGirl.create(:comment, article: article, user: user)
  end
end

end_time = Time.current

puts "=> Seeding ended (#{end_time - start_time}s)"
