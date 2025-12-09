module ProfileHelper
  include ActionView::RecordIdentifier
  def sent_request?(current_user, other_user)
    # current_user&.followees&.include?(other_user)
    @pending_friends.include?(current_user, other_user)
  end

  def pending?(current_user, other_user)
      # current_user&.followers&.include?(other_user)
      @pending_request.include?(current_user, other_user)
  end

  def accepted?(current_user, other_user)
    @friends.include?(current_user, other_user)
  end

  def dom_id_for_follower(follower)
    dom_id(follower)
  end
end
