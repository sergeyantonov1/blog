class CommentDecorator < ApplicationDecorator
  delegate :text, :formatted_created, :user
  delegate :full_name, to: :user, prefix: true

  def formatted_created(format = "%D %R")
    object.created_at.strftime(format)
  end
end
