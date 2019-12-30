class Publics::EventsController < Publics::ApplicationController
  def create
    @user = current_user
    @like = Like.where(user_id: current_user.id)
    @new_event = Event.new
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      respond_to do |format|
        format.html
        format.js
        format.json { render json: @event }
      end
    else
      flash.now[:danger] = '空白を埋めてください'
      render :new
    end
  end

  def new
    @new_event = Event.new
    # Why: エラー文を表示させるため(@event=Event.newがない場合、modal作成時NoMethodErrorが発生)
    @event = Event.new
  end

  def index
    @events = Event.all
    respond_to do |format|
      format.json { render json: @events }
    end
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :title, :description, :start, :end)
  end
end
