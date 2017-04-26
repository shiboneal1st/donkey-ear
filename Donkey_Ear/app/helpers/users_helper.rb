module UsersHelper
  def following?(user)
    !current_user.following_relationship.find_by_user_id(user.id).nil?
  end
end