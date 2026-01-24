class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[ edit update destroy ]
  before_action :correct_user, only: %i[ edit update destroy ]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post
    else
      redirect_to root_path, alert: "comment failed to save"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "comment_#{@comment.id}",
            partial: "comments/comment",
            locals: { comment: @comment }
          )
        end
        format.html { redirect_to @post }
      else
        format.html { render :edit, status: :unprocessable_entity }

        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @comment,
            partial: "comment/comment_form",
            locals: { comment: @comment }
          )
        end
      end
    end
  end

  def destroy
     @comment.destroy!

    respond_to do |format|
      format.html { redirect_to @post,
      notice: "comment was successfully destroyed.",
      status: :see_other }
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
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
end
