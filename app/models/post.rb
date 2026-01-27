class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  has_many :likes, dependent: :destroy
  validates :text, presence: true
end
