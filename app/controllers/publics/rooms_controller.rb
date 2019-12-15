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
  	@current = current_user
  	# ログインしているユーザーが作成したDM部屋(entry)を格納
  	@entries = @current.entries
  	# DMをしているユーザーと紐づく(room)を格納する場所を作成
  	room_ids = []
  	# ログインしているユーザーと紐づく(room)を格納
  	@entries.each do |entry|
  		room_ids << entry.room_id
  	end
  	# ログインしているユーザーを除く、作成されたDM部屋(room)を格納
  	@entry_users = Entry.where(room_id: room_ids).where('user_id != ?', @current.id)
  end
  private
  def entry_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
