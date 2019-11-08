class BooksController < ApplicationController
  skip_after_action :verify_authorized, except: :index, unless: :skip_pundit?
  skip_after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR author ILIKE :query"
      @books = Book.where(sql_query, query: "%#{params[:query]}%")
    else
    @books = policy_scope(Book).order(created_at: :desc)
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    authorize @book = Book.new
  end

  def edit
    authorize @book = Book.find(params[:id])
  end

  def create
    authorize @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def update
    authorize @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      # @book.errors
      render :new
    end
  end

  def destroy
    authorize @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publishing_year, :resume, :user)
  end
end
