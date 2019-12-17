class Publics::EventsController < Publics::ApplicationController
  def create
    @user = current_user
    @like = Like.where(user_id: @user.id)
    event = Event.new(event_params)
    event.user_id = current_user.id
    @event = event.save
    respond_to do |format|
      format.html
      format.js
      format.json {
        render json: @event
      }
    end
  end

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
    respond_to do |format|
      format.json {
        render json: @events
      }
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def event_params
    params.require(:event).permit(:user_id, :title, :description, :start, :end)
  end
end
