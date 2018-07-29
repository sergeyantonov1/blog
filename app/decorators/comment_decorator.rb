class CommentDecorator < ApplicationDecorator
  delegate :text, :created_at_h, :user
  delegate :full_name, to: :user, prefix: true

  def created_at_h
    object.created_at.strftime("%D %R")
  end
end
