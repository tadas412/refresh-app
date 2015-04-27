class EventsController < ApplicationController
  def new
  	@cur_user = current_user
  	@event = Event.new
  end

  def index
  	@events = Event.all
  	@cur_user = current_user
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
  		redirect_to events_path
  	else
  		render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
    @reviews = Review.where(:event_id => @event.id)
    @users = []
    @reviews.each do |review| 
      @users.push(User.find(review.user_id))
    end
  end

  def edit
  	@cur_user = current_user
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])
  	if @event.update_attributes(event_params)
  		redirect_to event_path(@event.id)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy!
  	redirect_to events_path
  end

  private

  def event_params
  	params.require(:event).permit(:name, :description, :date, :time)
  end
end
