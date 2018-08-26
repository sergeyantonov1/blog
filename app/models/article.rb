class Article < ApplicationRecord
  include PgSearch

  paginates_per 10

  has_many :comments
  has_many :tagging
  has_many :tags, through: :tagging

  belongs_to :user

  validates :title, :subtitle, :text, presence: true

  pg_search_scope :search_by_title_or_text,
    against: { title: "A", subtitle: "B", text: "C" },
    using: { tsearch: { prefix: true } }

  def all_tags=(titles)
    self.tags = titles.split(",").map do |title|
      Tag.where(title: title.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:title)
  end
end
