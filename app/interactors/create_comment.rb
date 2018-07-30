class CreateComment
  include Interactor

  delegate :author, :article, :comment, to: :context

  def call
    comment.user = author
    comment.article = article

    context.fail! unless comment.save
  end
end
