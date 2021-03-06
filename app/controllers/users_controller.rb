

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
  end


  def show
  	@user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id),notice:"successfully"
    else
       flash[:notice]= "error"
       redirect_to user_path(@user.id)
    end
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.save
  	redirect_to book_path(@book.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
