class Restaurant < ApplicationRecord
  has_many :collection_restaurants
  has_many :notes
  validates :name, :address, presence: true, uniqueness: true
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
