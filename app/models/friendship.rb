class Friendship < ApplicationRecord
  STATUS = %w(pending confirmed rejected)
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :status, inclusion: { in: STATUS }
  validates :asker, uniqueness: { scope: [:receiver] }

  def self.of_status(user, status)
    Friendship.where(
      "(asker_id = :id OR receiver_id = :id) AND status = :status",
       id: user.id, status: status
    ).pluck(:receiver_id).map { |id| User.find(id) }
  end

  def self.of_status_pending(user)
    Friendship.where(receiver_id: user.id, status: 'pending'
    ).pluck(:asker_id).map { |id| User.find(id) }
  end
end
