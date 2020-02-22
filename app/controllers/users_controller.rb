class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	  @users = User.all
      @book = Book.new
      @user = current_user
  end

  def show
  	  @book = Book.new
      @user = User.find(params[:id])
      @books = @user.books
  end

  def edit
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
