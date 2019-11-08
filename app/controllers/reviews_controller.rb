class ReviewsController < ApplicationController
  def new
    authorize @book = Book.find(params[:book_id])
    authorize @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    authorize @review = @book.reviews.new(review_params)
    @review.save!
    redirect_to book_path(@book)
  end

  def edit
    find_review
  end

  def update
    find_review
    @review.update(review_params)
  end

  def destroy
    find_review
    @review.destroy
  end

  private

  def find_review
    authorise @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :author, :book_id)
  end
end
