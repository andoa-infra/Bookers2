class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.page(params[:page]).reverse_order
    @book=Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
      flash[:notice]="book was successfully created"
  	  redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
  end

  private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
