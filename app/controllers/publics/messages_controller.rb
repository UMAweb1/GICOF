class Publics::MessagesController < Publics::ApplicationController
  def create
  	if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
  		@room = Room.find(message_params[:room_id].to_i)
  		@message = Message.new
  		@messaged = Message.create(message_params)
  		@messages = @room.messages.order(id: "DESC").page(params[:page]).per(10)
  		@entries = @room.entries
  	else
  		flash[:alert] = "メッセージ送信に失敗しました。"
  	end
	respond_to do |format|
	  format.html
	  format.js
	  format.json
	end
  end
  private
  def message_params
  	params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end
end
