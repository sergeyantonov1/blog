class SendCommentNotifications
  include Interactor

  delegate :comment, :article, to: :context

  def call
    CommentMailer.notification_to_article_owner(comment).deliver_later unless owner?
  end

  private

  def owner?
    comment.user == article.user
  end
end
