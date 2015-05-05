class ReviewsController < ApplicationController
  def new
  	@cur_user = current_user
  	@review = Review.new
  	@event_id = params[:id]
  	@event_name = params[:name]
  end

  def create
  	@review = Review.new(review_params)
  	if @review.save
      @user = User.find(@review.user_id)
      @user.num_reviews += 1
      @user.avg_rating = (@user.avg_rating * (@user.num_reviews - 1) + @review.rating) / @user.num_reviews
  		@user.save
      redirect_to event_path(params[:review][:event_id])
  	else
  		render 'new'
  	end
  end

  def index
  end

  private

  def review_params
  	params.require(:review).permit(:event_id, :user_id, :rating, :thumbs, :review)
  end
end
