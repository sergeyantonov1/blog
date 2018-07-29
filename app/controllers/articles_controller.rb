class ArticlesController < ApplicationController
  expose_decorated :article
  expose_decorated :articles, -> { fetch_articles }
  expose_decorated :comments, -> { fetch_comments }

  def create
    article.user = current_user

    article.save

    respond_with article
  end

  def update
    article.update(article_params)

    respond_with article
  end

  def destroy
    article.destroy

    respond_with article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def fetch_articles
    Articles::FilteredQuery.new(Article.all, params).all
  end

  def fetch_comments
    article.comments.includes(:user)
  end
end
