class AddFollowerAndFollowedToConnections < ActiveRecord::Migration[8.0]
  def change
    add_column :connections, :follower_id, :integer
    add_column :connections, :followed_id, :integer
  end
end
