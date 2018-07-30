class CommentArticle
  include Interactor::Organizer

  organize CreateComment, SendCommentNotifications
end
