class Friendship < ApplicationRecord
  STATUS = %w(pending confirmed rejected)
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :status, inclusion: { in: STATUS }
  validates :asker, uniqueness: { scope: [:receiver] }

  def self.of_status(user, status)
    Friendship.all.select { |friendship| ( friendship.asker == user || friendship.receiver == user) && friendship.status == status }
    .pluck(:receiver_id).map { |id| User.find(id) }
  end

  def self.of_status_pending(user)
    Friendship.all.select { |friendship|  friendship.receiver == user && friendship.status == 'pending' }
    .pluck(:asker_id).map { |id| User.find(id) }
  end
end
