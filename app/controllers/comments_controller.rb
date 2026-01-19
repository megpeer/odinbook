class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[ edit update destroy ]
  before_action :correct_user, only: %i[ edit update destroy ]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "comment failed to save"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: "Comment was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @post.comment.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "comment was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
  def correct_user
    unless @comment.user == current_user
      redirect_to root_path, alert: "You are not authorized to edit this post."
    end
  end
  def set_comment
    @comment = Comment.find(params.expect(:id))
  end
end
