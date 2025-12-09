class Connection < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"

  validates :follower_id, uniqueness: { scope: :followee_id }
  validate :cannot_friend_self

  attribute :accepted, :boolean, default: false

  private

  def cannot_friend_self
    errors.add(:base, "you cannot friend yourself") if follower_id == followee_id
  end
end
