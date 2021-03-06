class CommentMailer < ApplicationMailer
  default from: ENV["MAILER_SENDER_ADDRESS"]

  def notification_to_article_owner(comment)
    @article = comment.article.decorate
    @comment = comment.decorate
    receiver = @article.object.user.email

    mail to: receiver, subject: default_i18n_subject
  end
end
