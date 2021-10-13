class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).includes(:user).order(updated_at: :desc)
    # @books = Book.includes(:user).order(updated_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.includes(:user)
    @comment = current_user.comments.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :image)
  end
end
