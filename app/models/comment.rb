class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :text, :user, :article, presence: true
end
