class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @users = User.all
  end

  def follow
    @user = User.find(params[:id])
    Connection.create_or_find_by(follower_id: current_user.id, followed_id: @user.id)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to p_path(@user) }
    end
  end
  def unfollow
    @user = User.find(params[:id])
    Connection.where(follower_id: current_user.id, followed_id: @user.id).destroy_all

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to p_path(@user) }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
