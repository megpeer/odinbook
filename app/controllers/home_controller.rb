class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    # @users = User.all
    # @connections = Connection.all

    # @post = Post.new
    @pagy, @posts =pagy(
      Post.includes(:user)
          .order(created_at: :desc),
      items: 10,
      limit: 10
    )
  end
  def feed
    followee_ids = current_user.followees.pluck(:id)
    # @feed_posts = Post.where(user_id: followee_ids).order(created_at: :desc)
    @pagy, @posts =pagy(
      Post.includes(:user)
          .where(user_id: followee_ids)
          .order(created_at: :desc),
      items: 10,
      limit: 10
    )
    if turbo_frame_request?
      render partial: "posts/page",
            locals: { posts: @posts,
            pagy: @pagy,
            path: ->(opts) { feed_path(opts) } }
    end
  end
end
