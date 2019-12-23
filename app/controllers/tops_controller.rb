class TopsController < ApplicationController
  def about
  	@users = User.all
  end

  def term
  end

  def privacy_policy
  end
end
