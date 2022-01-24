class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id
  has_many :notes
  has_many :collections
  has_many :collection_restaurants, through: :collections
  validates :first_name, :last_name, :location, :avatar_url, presence: true

  def friends(status = 'confirmed')
    user_ids = Friendship.where(
      "(asker_id = :id OR receiver_id = :id) AND status = :status",
       id: self.id, status: status
    ).pluck(:asker_id, :receiver_id)
     .flatten
     .uniq
     .reject { |id| id == self.id }

    users = User.where(id: user_ids)
  end

  def friend_of?(user)
    self.friends.include? user
  end
end
