class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.user_id = current_user.id
      @book.save
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
