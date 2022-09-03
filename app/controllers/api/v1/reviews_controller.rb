class Api::V1::ReviewsController < ApplicationController
  def show
    render json: Review.where(category_id: params[:id]).to_json()
  end

  def get_review
    render json: Review.find(params[:review_id]).to_json()
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: review
    else
      render json: review.erros, status: 422
    end
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      render json: review.to_json()
    else
      render json: review.errors, status: 422
    end
  end

  def destroy
    review = Category.find(params[:id])
    if params[:category_id] == review.category_id
      review.destroy
      render json: review.to_json()
    else
      render json: { message: 'can not delete data' }, status: 422
    end
  end

  private

    def review_params
      params.require(:review).permit(:title, :category_id, :evaluation, :done, :visit_day)
    end
end
