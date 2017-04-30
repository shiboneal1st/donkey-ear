class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :receiptor, :class_name => 'User', :foreign_key => 'receiptor_id'

  def json_api
    {
      id: id,
      creator_id: creator.id,
      creator_name: creator.name,
      creator_img: creator.picture.url,
      content: content
    }
  end
end
