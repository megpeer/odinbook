class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.find_or_create_by(user: current_user)

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          dom_id(@post),
          partial: "posts/post",
          locals: { post: @post })
      end
    end
  end

  def destroy
    @post.likes.find_by(user: current_user)&.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          dom_id(@post),
          partial: "posts/post",
          locals: { post: @post })
      end
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
