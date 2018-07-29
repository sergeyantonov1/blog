class ArticlesController < ApplicationController
  expose_decorated :article
  expose_decorated :articles, -> { fetch_articles }
  expose_decorated :comments, -> { fetch_comments }

  before_action :authorize_resource, only: %i[create update destroy]

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

  def authorize_resource
    authorize article
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def fetch_articles
    Articles::FilteredQuery.new(Article.includes(:user), params).all.page(params[:page])
  end

  def fetch_comments
    article.comments.includes(:user).page(params[:page])
  end
end
