class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @connections = Connection.all
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end
end
