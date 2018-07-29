class CommentsController < ApplicationController
  expose :comment, attributes: :comment_params
  expose :article
  expose_decorated :comments, -> {article.comments}

  before_action :authorize_resource, only: %i[create destroy]

  def create
    comment.user = current_user
    comment.article = article

    if comment.save
      flash[:notice] = "Comment was successfully created."
    else
      flash[:alert] = "Comment could not be created."
    end

    redirect_to article
  end

  def destroy
    comment.destroy

    redirect_to article
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def authorize_resource
    authorize comment
  end
end
