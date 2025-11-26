class Connection < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"

  # validates :followee_id, uniqueness: { scope: :follower_id, message: "already a friend" }
  # validate :already_friended

  # private

  # def already_friended
  #   if Connection.exists?(followee_id: followee_id, follower_id: follower_id)
  #   errors.add(:followee_id, "You already friended this guy")
  #   end
  # end
end
