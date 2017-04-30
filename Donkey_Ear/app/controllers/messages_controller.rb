class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params) do |message|
      message.creator = current_user
      chat = Chat.find(params[:chat_id])
      if chat.user1 == current_user
        message.receiptor = chat.user2
      else
        message.receiptor = chat.user1
      end
      message.chat = chat
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end