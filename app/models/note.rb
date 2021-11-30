class Note < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :content, presence: true
  validates :price, presence: true
  validates :rating, presence: true
end
