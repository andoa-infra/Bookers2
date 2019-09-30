class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
  end

  def home
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.book.page(params[:page]).reverse_order
  end

  def show
  	@user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path(@book.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
