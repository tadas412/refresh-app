class UsersController < ApplicationController
  def index
  	@users = User.all
  	@cur_user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@reviews = Review.where(:user_id => @user.id)
  	@events = []
  	@reviews.each do |review| 
  		@events.push(Event.where(:id => review.event_id)[0])
  	end
  end

  def make_admin
    @user = User.find(params[:user_id])
    @user.admin = true
    @user.save
    redirect_to "/users"
  end

  def remove_admin
    @user = User.find(params[:user_id])
    @user.admin = false
    @user.save
    redirect_to "/users"
  end


end
