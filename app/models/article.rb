class Article < ApplicationRecord
  include PgSearch

  paginates_per 10

  default_scope { order(created_at: :desc) }

  has_many :comments

  belongs_to :user

  validates :title, :subtitle, :text, presence: true

  pg_search_scope :search_by_title_or_text,
    against: { title: "A", subtitle: "B", text: "C" },
    using: { tsearch: { prefix: true } }
end
