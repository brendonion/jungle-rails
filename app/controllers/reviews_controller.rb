class ReviewsController < ApplicationController
  before_filter :current_user

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = product_id
    if @review.save
      puts "SUCCESS"
      redirect_to "/products/#{product_id}", notice: 'Review submitted!'
    else
      redirect_to "/products/#{product_id}", notice: 'Failed to post review.'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{product_id}", notice: 'Review deleted!'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

    def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
    end

    def product_id
      params.require(:product_id)
    end
end
