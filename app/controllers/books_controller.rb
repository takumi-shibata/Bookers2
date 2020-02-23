class BooksController < ApplicationController
      before_action :authenticate_user!
      before_action :correct_user, only: [:edit, :update]
  def index
      @book = Book.new
      @books = Book.all
      @user = current_user
  end

  def show
      @book = Book.new
      @book_id = Book.find(params[:id])
      @user = @book_id.user
      
  end

  def edit
      @book = Book.find(params[:id])
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id #完成版のURLを見れば分かる新規投稿でbooksのidが変わってる
      @user = current_user
      @books = Book.all
      if @book.save
          redirect_to book_path(@book.id), notice: "You have creatad book successfully."
      else
          render :index
      end
  end

  def update
      @book = Book.find(params[:id])
      @book_id = Book.find(params[:id])
      @user = @book_id.user
    if @book.update(book_params)
        redirect_to book_path(@book.id), notice: "You have updated user successfully."
    else
        render :show
    end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  def correct_user
    book = Book.find(params[:id])
    userid = book.user
    if current_user != userid
      redirect_to books_path
    end
  end
end
