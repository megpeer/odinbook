class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :image
         has_many :posts, dependent: :destroy
  # ----------------------------------
  # Connections where I follow someone
  # ----------------------------------
  has_many  :active_connections,
            foreign_key: :follower_id,
            class_name: "Connection",
            dependent: :destroy

  has_many  :followees,
            through: :active_connections,
            source: :followee
  # ----------------------------------
  # Connections where someone follows me
  # ----------------------------------
  has_many  :passive_connections,
            foreign_key: :followee_id,
            class_name: "Connection",
            dependent: :destroy

  has_many  :followers,
            through: :passive_connections,
            source: :follower
  # ----------------------------------
  # Helpers
  # ----------------------------------
  # Outgoing pending request (I sent)
  def pending_request_to?(other_user)
    active_connections.exists?(followee_id: other_user.id, accepted: false)
  end
  # Incoming pending request (sent to me)
  def pending_request_from?(other_user)
    passive_connections.exists?(follower_id: other_user.id, accepted: false)
  end
  # Are we friends? (accepted both ways)
  def friend?(other_user)
    friends.include?(other_user)
  end
  # Rturn all pending passive connections
  def pending
    passive_connections.where(accepted: false).map(&:follower)
  end
  # Return all accepted freinds (users)
  def friends
    outgoing = active_connections.where(accepted: true).map(&:followee)
    incoming = passive_connections.where(accepted: true).map(&:follower)
    outgoing + incoming
  end
end
