class Connection < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"
  # scope :pending, -> { where(accepted: false) }
  # scope :accepted_connections, -> { where(accepted: true) }
end
