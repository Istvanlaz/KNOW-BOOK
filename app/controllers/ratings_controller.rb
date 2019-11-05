class RatingsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @rating = Rating.new
  end

  def edit
    # @rating = Rating.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @rating = Rating.new(rating_params)
    @rating.book = @book
    if @rating.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def update
    # @rating = Rating.find(params[:book_id])
    # @rating.update(rating_params)
    # redirect_to ratings_path(@rating)
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :book_id)
  end
end
