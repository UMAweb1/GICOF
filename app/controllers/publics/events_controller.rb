class Publics::EventsController < Publics::ApplicationController
  def create
    @user = current_user
    @like = Like.where(user_id: @user.id)
    @new_event = Event.new
    event = Event.new(event_params)
    event.user_id = current_user.id
    if event.start == event.end
      flash.now[:warning] = "空白が存在するか開始時刻と終了時刻に問題があります"
      render :new
    else
      if event.save
        # 開始時刻より終了時刻が前の時刻の場合削除しエラー文を表示y
        if event.end < event.start
          event.destroy
          flash.now[:warning] = "開始時刻と終了時刻に問題があります"
          render :new
        else
          respond_to do |format|
            format.html
            format.js
            format.json {
              render json: @event
            }
          end
        end
      else
        flash.now[:danger] = "空白を埋めてください"
        render :new
      end
    end
  end

  def new
    @new_event = Event.new
  end

  def index
    @events = Event.all
    respond_to do |format|
      format.json {
        render json: @events
      }
    end
  end
  private
  def event_params
    params.require(:event).permit(:user_id, :title, :description, :start, :end)
  end
end
