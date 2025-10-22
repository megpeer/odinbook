class Connection < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # follower = sender
  # followee = receiver
end
