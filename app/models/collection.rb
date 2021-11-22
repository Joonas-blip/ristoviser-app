class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_restaurants
  has_many :restaurants, through: :collection_restaurants
  validates :name, presence: true, uniqueness: true
end
