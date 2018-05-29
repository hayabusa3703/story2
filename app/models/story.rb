class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments
  scope :by_created_at, -> { order('created_at DESC') }
end
