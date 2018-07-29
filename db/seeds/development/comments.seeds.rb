class << self
  def random_user_id
    Random.rand(user_count) + 1
  end

  def user_count
    @user_count ||= User.count
  end
end

after "development:articles" do
  Article.all.each do |article|
    7.times do
      FactoryGirl.create(:comment, article: article, user: User.find(random_user_id))
    end
  end
end
