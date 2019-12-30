class TopsController < ApplicationController
  def about
    @users = User.all
  end
end
