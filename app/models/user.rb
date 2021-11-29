class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships
  has_many :notes
  has_many :collections
  has_many :collection_restaurants, through: :collections
  validates :first_name, :last_name, :location, :avatar_url, presence: true

  def friends(status = 'confirmed')
    user_ids = Friendship.where(
      "(user_id = :id OR friend_id = :id) AND status = '#{status}'",
       id: self.id
    ).pluck(:user_id, :friend_id)
     .flatten
     .uniq
     .reject { |id| id == self.id }

    users = User.where(id: user_ids)
  end

  def friend_of?(user)
    Friendship.where("(user_id = :id OR friend_id = :id) AND status = 'confirmed'",
    id: user.id)
              .pluck(:user_id, :friend_id)
              .flatten
              .uniq
              .find { |id| id == user.id}
  end
end
