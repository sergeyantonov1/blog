class Tag < ApplicationRecord
  has_many :tagging
  has_many :articles, through: :tagging

  validates :title, presence: true, uniqueness: true

  def self.all_titles
    Tag.pluck(:title)
  end
end
