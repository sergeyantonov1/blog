class ArticleDecorator < ApplicationDecorator
  delegate :title, :subtitle, :text, :user
  delegate :full_name, to: :user, prefix: true

  def created_at_h
    object.created_at.strftime("%B %d, %Y")
  end
end
