class CommentsController < ApplicationController
  expose :article
  expose :comment, attributes: :comment_params
  expose_decorated :comments, :paginate_comments

  before_action :authorize_resource, only: %i[create destroy]

  def create
    result = CommentArticle.call(article: article, author: current_user, comment: comment)

    self.comment = Comment.new if result.success?

    render "fragments", layout: false
  end

  def destroy
    comment.destroy

    redirect_to article
  end

  private

  def fetch_comments
    article.comments.includes(:user).order(created_at: :desc)
  end

  def paginate_comments
    fetch_comments.page(params[:page])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def authorize_resource
    authorize comment
  end
end
