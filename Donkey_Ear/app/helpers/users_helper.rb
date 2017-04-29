module UsersHelper
  ANONYMOUS_NAME = ["apple", "banana", "blueberry", "grape", "kiwi", "melon", "orange", "papaya", "peach", "pear"]
  def following?(user)
    !current_user.following_relationship.find_by_user_id(user.id).nil?
  end

  def get_anonymous_name(user_id)
    base_name =  ANONYMOUS_NAME[user_id % ANONYMOUS_NAME.size]
    postfix = (user_id / ANONYMOUS_NAME.size).to_s
    anonymous_name = base_name + postfix
    return anonymous_name
  end

  def get_anonymous_picture_url(user_id)
    base_name = ANONYMOUS_NAME[user_id % ANONYMOUS_NAME.size]
    return "/assets/" + base_name + ".png"
  end

  def has_chat?(user)
    !current_user.chats_as_creator.find_by_user2_id(user.id).nil? || !current_user.chats_as_participant.find_by_user1_id(user.id).nil?
  end

  def get_chat(user)
    current_user.chats_as_creator.find_by_user2_id(user.id) || current_user.chats_as_participant.find_by_user1_id(user.id)
  end
end