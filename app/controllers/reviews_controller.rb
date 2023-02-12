class ReviewsController < ApplicationController
  before_action :set_list, only: [:create]

  def create
    @review = Review.create(review_params)
    @review.list = @list
    if @review.save!
      redirect_to list_path(@list)
    else
      render :list
    end

  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :list_id)
  end
end
