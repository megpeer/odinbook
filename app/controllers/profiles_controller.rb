class ProfilesController < ApplicationController
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
    render html: render_to_string(
      partial: "profiles/name",
      collection: @names,
      as: :user
    ).then { |content| "<turbo-frame id='names'>#{content}</turbo-frame>".html_safe }
      else
    render html: "<turbo-frame id='names'></turbo-frame>".html_safe
      end
  end
def friends
  @friends = current_user.friends
  render :friends
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

    connection = Connection.find_by(
      follower_id: pending_friend.id,
      followee_id: current_user.id
    )

    connection&.update!(accepted: true)

    redirect_to friends_profile_path, status: :see_other
  end

  def delete_userpage
    pending_friend = User.find(params[:id])

    connection = Connection.find_by(
      follower_id: pending_friend.id,
      followee_id: current_user.id
    )

    connection&.destroy
    current_user.reload

    redirect_to friends_profile_path, status: :see_other
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
        partial: "profiles/follow_button",
        locals: { user: @user }
      ),
      turbo_stream.update(
        "#{@user.id}-follower-count",
        partial: "profiles/follower_count",
        locals: { user: @user }
      )
    ]
  end

  def render_friendlist_update
    current_user.reload
    render turbo_stream: turbo_stream.replace(
         "user-#{current_user.id}-friends",
          partial: "profiles/friends_content"
    )
  end
end
