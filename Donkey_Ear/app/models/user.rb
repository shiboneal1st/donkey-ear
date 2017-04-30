class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :trackable, :validatable

  has_many :tweets
  has_many :followed_relationship, class_name: "Relationship", foreign_key: "user_id"
  has_many :following_relationship, class_name: "Relationship", foreign_key: "follower_id"

  has_many :chats_as_creator, class_name: "Chat", foreign_key: "user1_id"
  has_many :chats_as_participant, class_name: "Chat", foreign_key: "user2_id"

  has_many :following, through: :following_relationship, source: :user
  has_many :followed, through: :followed_relationship, source: :follower

  has_many :messages_as_creator, class_name: "Message", foreign_key: "creator_id"
  has_many :messages_as_receiptor, class_name: "Message", foreign_key: "receiptor_id"

  has_one :anonymous_profile
  mount_uploader :picture, PictureUploader
end
