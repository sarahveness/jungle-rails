class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    puts review_params
    @review = Review.new(review_params)
    @product = Product.find(params["product_id"])
    if @review.save
      flash[:success] = "Thanks for leaving a review!"
      redirect_to :back
    else
      puts @review.errors.to_a
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end


private

  def review_params
    params.require(:review).permit(:description, :rating, :product_id, :user_id)
  end

end
