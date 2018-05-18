class Category < ApplicationRecord
  belongs_to :story
  has_many :stories
end
