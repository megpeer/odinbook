class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @connections = Connection.all
    @posts = Post.all
    @post = Post.new
    # @comment = @post.comments.build
  end
end
