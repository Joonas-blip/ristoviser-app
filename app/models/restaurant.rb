class Restaurant < ApplicationRecord
  before_validation :build_address
  has_many :collection_restaurants
  has_many :notes
  validates :name, presence: true
  #validates :city, :country, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, uniqueness: { scope: [:address] }

  def build_address
    if self.street_address != nil
      self.address = "#{street_address}, #{city}, #{country}"
    end
  end

  def self.query_api(restaurant)
    base_url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input="
    query = restaurant.split
    query = query.join('%20')
    url = URI("#{base_url}#{query}&inputtype=textquery&fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry%2Cphotos&key=AIzaSyA7dKW-dn_QDd9uIOZcOtDfNLh7rv-JCr8")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    data = response.body
    result = JSON.parse(data)
    result['candidates']
  end

  def self.retrieve_photo(search_result)
    photos = search_result['photos']
    photo_reference = photos.first['photo_reference']
    photo_url = URI("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{photo_reference}&key=AIzaSyA7dKW-dn_QDd9uIOZcOtDfNLh7rv-JCr8")
    https = Net::HTTP.new(photo_url.host, photo_url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(photo_url)
    resp = https.request(request)
    parse = Nokogiri::HTML(resp.body)
    parse.search("a").first.attributes["href"].value
  end
end
