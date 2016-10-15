class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    puts review_params
    @review = Review.new(review_params)
    @product = Product.find(params["product_id"])
    @review.product_id = params["product_id"]
    @review.rating = params["rating"].to_i
    @review.user = @current_user
    if @review.save
      flash[:success] = "Thanks for leaving a review!"
      redirect_to :back
    else
      puts @review.errors.to_a
    end
  end


private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
