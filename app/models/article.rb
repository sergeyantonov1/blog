class Article < ApplicationRecord
  include PgSearch

  paginates_per 10

  has_many :comments

  belongs_to :user, inverse_of: :articles

  validates :title, :text, presence: true

  pg_search_scope :search_by_title_or_text,
    against: %i[title text],
    using: { tsearch: { prefix: true } }
end
