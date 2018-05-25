class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :by_created_at, -> { order('created_at DESC') }

end
