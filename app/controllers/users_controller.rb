class UsersController < ApplicationController
  def index
  	@users = User.all
  	@cur_user = current_user
  end
end
