class ProfileController < ApplicationController
  include ProfileHelper
  before_action :authenticate_user!
  before_action :set_user, only: [ :show, :follow, :unfollow ]
  before_action :set_friendship_data, only: [ :show ]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).includes(:user, :comments)
  end

  def index
    if params[:query].present?
      @names = User.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @names = User.none
    end
      if turbo_frame_request?
    #     render turbo_stream: turbo_stream.replace(
    #       "names",
    #       partial: "profile/name",
    #       collection: @names,
    #       as: :user
    #     )
    #     else
    #     render :index
    #     end
    # end
    # if turbo_frame_request?
    render html: render_to_string(
      partial: "profile/name",
      collection: @names,
      as: :user
    ).then { |content| "<turbo-frame id='names'>#{content}</turbo-frame>".html_safe }
      else
    render :index
      end
  end


  def follow
    connection = Connection.find_or_initialize_by(
      follower_id: current_user.id,
      followee_id: @user.id
    )
    if connection.new_record?
      connection.accepted = false
      connection.save
    end
    set_friendship_data
    render_follow_button_update
  end
  def unfollow
    # outgoing OR incoming connections should be removable
    connection = Connection.where(
      follower_id: current_user.id, followee_id: @user.id
      ).or(Connection.where(
      follower_id: @user.id, followee_id: current_user.id
      ))
    connection.destroy_all
    set_friendship_data
    render_follow_button_update
  end

  def accept
    connection = Connection.where(
                  follower_id: @user.id,
                  followee_id: current_user.id
                  )
    connection.update(accepted: true)
    set_friendship_data
    render_follow_button_update
  end

  def accept_userpage
    pending_friend = User.find(params[:id])
    connection = Connection.where(
                  follower_id: pending_friend.id,
                  followee_id: current_user.id
                  )
    connection.update(accepted: true)
    render_friendlist_update
  end

  def delete_userpage
    pending_friend = User.find(params[:id])
    connection = Connection.where(
                  follower_id: pending_friend.id,
                  followee_id: current_user.id
                  )
    connection.destroy_all
    render_friendlist_update
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_friendship_data
    current_user.reload
    @pending_friends  = current_user.active_connections.where(accepted: false).map(&:followee)
    @pending_request  = current_user.passive_connections.where(accepted: false).map(&:follower)
    @friends          = current_user.friends
  end

  def render_follow_button_update
    frame_id = "user-#{@user.id}-follow-button"

    render turbo_stream: [
      turbo_stream.update(
        frame_id,
        partial: "profile/follow_button",
        locals: { user: @user }
      ),
      turbo_stream.update(
        "#{@user.id}-follower-count",
        partial: "profile/follower_count",
        locals: { user: @user }
      )
    ]
  end

  def render_friendlist_update
    frame_id = "user-#{current_user.id}-friends-list"
    render turbo_stream: [
      turbo_stream.update(
        frame_id,
        partial: "profile/friends_list",
        locals: { user: current_user }
      )
    ]
  end
end
