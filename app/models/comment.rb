class Comment < ApplicationRecord
  paginates_per 5

  belongs_to :user
  belongs_to :article

  validates :text, :user, :article, presence: true
end
