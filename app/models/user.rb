class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :followed_users,
            foreign_key: :followed_id,
            class_name: "Connection",
            dependent: :destroy

  has_many  :followees, through: :followed_users, source: :followed, dependent: :destroy

  has_many  :following_users,
            foreign_key: :follower_id,
            class_name: "Connection",
            dependent: :destroy

  has_many  :followers, through: :following_users, source: :follower, dependent: :destroy

  def following?(other_user)
  followed_users.include?(other_user)
  end
end
