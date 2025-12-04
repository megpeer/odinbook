class ProfileController < ApplicationController
  include ProfileHelper
  before_action :authenticate_user!
  before_action :set_user

  def show
    @pending_friends = current_user.following_users.where(accepted: false)
    following_friends = current_user.following_users.where(accepted: true)
    followed_friends = current_user.followed_users.where(accepted: true)
    @friends = following_friends + followed_friends
  end

  def accept
    @friendship = Connection.find(params[:id])
    if @friendship.update(accepted: true)
      redirect_to profile_path(current_user.id), notice: "user was sucessfully updated"
    else
      redirect_to profile_path(current_user.id), alert: "friend failed to add"
    end
  end

  def delete
    @friendship = Connection.find(params[:id])
    @friendship.destroy
      redirect_to profile_path(current_user.id), notice: "user was removed from friends list"
  end

  def follow
    Connection.create_or_find_by(follower_id: current_user.id, followee_id: @user.id)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(dom_id_for_follower(@user),
              partial: "profile/follow_button",
              locals: { user: @user }),
            turbo_stream.update("#{@user.id}-follower-count",
              partial: "profile/follower_count",
              locals: { user: @user })
          ]
        end
      end
  end
  def unfollow
    current_user.followed_users.where(follower_id: current_user.id, followee_id: @user.id).destroy_all
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(dom_id_for_follower(@user),
            partial: "profile/follow_button",
            locals: { user: @user }),
          turbo_stream.update("#{@user.id}-follower-count",
            partial: "profile/follower_count",
            locals: { user: @user })
        ]
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
