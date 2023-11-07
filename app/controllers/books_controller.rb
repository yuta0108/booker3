class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render "show"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
