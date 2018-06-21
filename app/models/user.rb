class User < ApplicationRecord
  has_many :stories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :stories
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_stories, through: :likes, source: :story
end
