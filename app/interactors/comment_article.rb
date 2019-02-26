class CommentArticle
  include Interactor::Organizer

  organize CreateComment, SendCommentNotification
end
