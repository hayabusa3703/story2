class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :user
  validates :text, presence: true
end
