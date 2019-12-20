class Admins::GamegenresController < Admins::ApplicationController
  def new
  	@genres = Gamegenre.all
  	@new_genre = Gamegenre.new
  end

  def create
  	genre = Gamegenre.new(gamegenre_params)
  	if genre.save
  		redirect_to new_admins_gamegenre_path, success: "追加が成功しました"
  	else
  		redirect_to new_admins_gamegenre_path, danger: "追加が失敗しました"
  	end

  end

  def destroy
  	genre = Gamegenre.find(params[:id])
  	genre.destroy
  	redirect_to new_admins_gamegenre_path, danger: "削除が成功しました"
  end
  private
  def gamegenre_params
  	params.require(:gamegenre).permit(:gamegenre)
  end
end
