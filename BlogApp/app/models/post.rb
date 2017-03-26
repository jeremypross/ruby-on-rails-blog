class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :post_text, presence: true
  validates :title, presence: true
  validates :post_image, presence: true
end
