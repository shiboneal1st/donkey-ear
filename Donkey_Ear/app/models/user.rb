class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :trackable, :validatable

  has_many :followed_relationship, class_name: "Relationship", foreign_key: "user_id"
  has_many :following_relationship, class_name: "Relationship", foreign_key: "follower_id"

  has_many :following, through: :following_relationship, source: :user
end
