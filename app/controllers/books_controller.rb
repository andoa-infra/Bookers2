class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.page(params[:page]).reverse_order
    @book=Book.new

  end

  def show
  	@bookj = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@bookj.user.id)
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
  	if @book.save
      flash[:notice]="book was successfully created"
  	  redirect_to book_path(@book)
    else
      render 'index'
    end
  end

  def edit
     @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book.id),notice:"book was successfully updated"

    else
      flash[:notice]= "error"
      redirect_to book_path(@book.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
