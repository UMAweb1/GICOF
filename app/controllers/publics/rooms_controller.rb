class Publics::RoomsController < Publics::ApplicationController
  def create
  	@room = Room.create
  	@entry_user = Entry.create(room_id: @room.id, user_id: current_user.id)
  	@entry_matching = Entry.create(entry_params)
  	redirect_to room_path(@room)
  end

  def show
  	@room = Room.find(params[:id])
  	if Entry.where(user_id: current_user.id, room_id: @room.id).present?
  		@messages = @room.messages.order(id: "DESC").page(params[:page]).per(10)
  		@message = Message.new
  		@entries = @room.entries
  	else
  		redirect_to user_path(current_user)
  	end
  end

  def index
  end
  private
  def entry_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
