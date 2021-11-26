class Friendship < ApplicationRecord
  STATUS = %w(pending confirmed rejected)
  belongs_to :user
  validates :friend_id, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :user, uniqueness: { scope: [:friend_id] }


  def self.of_status(user, status)
    Friendship.all.select { |friendship| friendship.user == user && friendship.status == status }
    .pluck(:friend_id).map { |id| User.find(id) }
  end
end
