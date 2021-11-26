class CollectionRestaurant < ApplicationRecord
  belongs_to :restaurant
  belongs_to :collection
  validates :collection, uniqueness: { scope: [:restaurant] }
end
