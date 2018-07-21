class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :text
end
