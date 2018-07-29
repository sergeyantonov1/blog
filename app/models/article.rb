class Article < ApplicationRecord
  has_many :comments

  belongs_to :user, inverse_of: :articles

  validates :title, :text, presence: true
end
