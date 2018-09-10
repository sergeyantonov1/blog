class ArticleDecorator < ApplicationDecorator
  delegate :title, :subtitle, :text, :formatted_created
  delegate :full_name, to: :user, prefix: true

  def formatted_created(format = "%B %d, %Y")
    object.created_at.strftime(format)
  end

  def with_tags
    object.tags.each do |tag|

       yield(tag.title)
    end
  end

  private

  def user
    @user ||= object.user
  end
end
