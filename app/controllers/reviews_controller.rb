class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # @review.restaurant_id = @restaurant.id
    @review.restaurant = @restaurant    # 关联评论与餐厅
    if @review.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private


  def review_params
    params.require(:review).permit(:content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
