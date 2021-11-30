class Restaurant < ApplicationRecord
  before_validation :build_address
  has_many :collection_restaurants
  has_many :notes
  validates :name, presence: true, uniqueness: true
  #validates :city, :country, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def build_address
    if self.street_address != nil
      self.address = "#{street_address}, #{city}, #{country}"
    end
  end
end
