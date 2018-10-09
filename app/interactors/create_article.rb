class CreateArticle
  include Interactor::Organizer

  organize SaveArticle, SendArticleSlackNotification
end
