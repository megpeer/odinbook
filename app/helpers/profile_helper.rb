module ProfileHelper
  include ActionView::RecordIdentifier
def following?(other_user)
  # followed.include?(other_user)
  current_user&.followed_users.include?(other_user)
end

  def dom_id_for_follower(follower)
    dom_id(follower)
  end
end
