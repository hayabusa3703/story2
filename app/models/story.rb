class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments
  scope :by_created_at, -> { order('created_at DESC') }
  scope :love, -> { where(Category_id: 1) }
  scope :marriage, -> { where(Category_id: 2) }
  scope :study, -> { where(Category_id: 3) }
  scope :job, -> { where(Category_id: 4) }
  scope :newlife, -> { where(Category_id: 5) }
  scope :travel, -> { where(Category_id: 6) }
  scope :sick, -> { where(Category_id: 7) }
  scope :everydaylife, -> { where(Category_id: 8) }
end
