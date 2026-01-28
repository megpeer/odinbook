class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @connections = Connection.all
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end
  def feed
    followee_ids = current_user.followees.pluck(:id)
    @feed_posts = Post.where(user_id: followee_ids).order(created_at: :desc)
  end
end
