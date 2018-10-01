class UpdateArticle
  include Interactor

  delegate :params, :article, to: :context

  def call
    update_article!
  rescue ActiveRecord::ActiveRecordError => e
    context.fail!(message: e.message)
  end

  private

  def update_article!
    ActiveRecord::Base.transaction do
      update_tags!

      article.update!(article_attributes)
    end
  end

  def update_tags!
    return unless article_tags

    article.tags = article_tags.map do |tag|
      Tag.where(title: tag.strip).first_or_create!
    end
  end

  def article_tags
    params[:tags]&.split(",")
  end

  def article_attributes
    params.except(:tags)
  end
end
