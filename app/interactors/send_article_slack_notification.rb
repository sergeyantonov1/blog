class SendArticleSlackNotification
  include Interactor
  include Rails.application.routes.url_helpers

  delegate :author, :article, to: :context

  def call
    SlackMessageJob.perform_later(generate_message)
  end

  private

  def generate_message
    I18n.t("clients.slack.create_article",
      user: author.full_name,
      article: article.title,
      url: article_url(article))
  end
end
