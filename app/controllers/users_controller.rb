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


end
