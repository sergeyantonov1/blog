class CreateArticle
  include Interactor

  delegate :params, :author, :article, to: :context

  before do
    context.article = Article.new(article_attributes)
  end

  def call
    save_article!
  rescue ActiveRecord::ActiveRecordError => e
    context.fail!(message: e.message)
  end

  private

  def save_article!
    ActiveRecord::Base.transaction do
      create_tags!

      article.save!
    end
  end

  def create_tags!
    return unless article_tags

    article.tags = article_tags.map do |tag|
      Tag.where(title: tag.strip).first_or_create!
    end
  end

  def article_tags
    params[:tag_titles]&.split(" ")
  end

  def article_attributes
    params.except(:tag_titles).merge(user: author)
  end
end
