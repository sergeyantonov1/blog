class ArticlesController < ApplicationController
  expose_decorated :article
  expose_decorated :articles, :paginate_articles
  expose_decorated :comments, :paginate_comments
  expose :comment, -> { Comment.new }

  before_action :authenticate_user!, only: %i[new create]
  before_action :authorize_resource!, only: %i[edit update destroy]

  def index
  end

  def show
  end

  def edit
  end

  def create
    self.article =
      CreateArticle.call(params: article_params, author: current_user).article

    respond_with(article)
  end

  def update
    self.article =
      UpdateArticle.call(article: article, params: article_params).article

    respond_with(article)
  end

  def destroy
    article.destroy

    respond_with(article)
  end

  private

  def authorize_resource!
    authorize article
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :text, :tags)
  end

  def fetch_articles
    Articles::FilteredQuery.new(ordered_articles, params).all
  end

  def fetch_comments
    article.comments.includes(:user).order(created_at: :desc)
  end

  def paginate_comments
    fetch_comments.page(params[:page])
  end

  def paginate_articles
    fetch_articles.page(params[:page])
  end

  def ordered_articles
    Article.includes(:user).order(created_at: :desc)
  end
end
