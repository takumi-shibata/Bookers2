class BooksController < ApplicationController
	before_action :authenticate_user!
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
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id #完成版のURLを見れば分かる新規投稿でbooksのidが変わってる
      @user = current_user
      @books = Book.all
      if @book.save
          redirect_to book_path(@book.id), notice: "Book was successfully created."
      else
          render :index
      end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
