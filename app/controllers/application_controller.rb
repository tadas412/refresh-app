class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def search
    @events = Event.where("name LIKE ?", "%"+params[:search]+"%")
    @users = User.where("user_name LIKE ?", "%"+params[:search]+"%")
    @reviews = Review.where("review LIKE ?", "%"+params[:search]+"%")
    @review_events = []
    @reviews.each do |review| 
      @review_events.push(Event.where(:id => review.event_id)[0])
    end
    @review_users = []
    @reviews.each do |review| 
      @review_users.push(User.find(review.user_id))
    end
    @show_events = params[:show_events] == "true" ? true : false
    @show_reviews = params[:show_reviews] == "true" ? true : false
    @show_users = params[:show_users] == "true" ? true : false
    @cur_user = current_user
    render 'application/search'
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :user_name
  end
  # https://github.com/plataformatec/devise#strong-parameters
end
