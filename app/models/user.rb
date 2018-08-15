class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :full_name, presence: true
end
