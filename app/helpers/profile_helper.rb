module ProfileHelper
  include ActionView::RecordIdentifier
def following?(other_user)
  current_user&.followees&.include?(other_user)
end

def accepted?(other_user)
  current_user&.followees&.include?(other_user)
end
  # if
  def dom_id_for_follower(follower)
    dom_id(follower)
  end
end
