class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :receiptor, :class_name => 'User', :foreign_key => 'receiptor_id'
end
