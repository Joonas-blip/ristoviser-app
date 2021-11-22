class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships
  has_many :notes
  has_many :collections
  has_many :collection_restaurants, through: :collections
  validates :first_name, :last_name, :location, :avatar, presence: true
end
