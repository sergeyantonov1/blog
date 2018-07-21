class Article < ApplicationRecord
  belongs_to :user, inverse_of: :articles

  validates :title, :text, presence: true
end
