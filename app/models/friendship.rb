class Friendship < ApplicationRecord
  STATUS = %w(pending confirmed rejected)
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :status, inclusion: { in: STATUS }
  validates :asker, uniqueness: { scope: [:receiver] }

  def self.of_status_pending(user)
    user_ids = Friendship.where(receiver_id: user.id, status: 'pending'
    ).pluck(:asker_id)
    users = User.where(id: user_ids)
  end
end
