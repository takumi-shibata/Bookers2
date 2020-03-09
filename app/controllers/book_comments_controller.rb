class BookCommentsController < ApplicationController
  def show
  end

  def new
  end

  def index
  end

  def edit
  end

  def create
    @book_id = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book_id.id
    if @book_comment.save
      redirect_to book_path(@book_id)
    else
      @user = @book_id.user
      @book = Book.new
      render template: "books/show"
    end
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.find(params[:id])
    if @comment.destroy
      redirect_to book_path(@book)
    end
  end

  private
  def book_comment_params
      params.require(:book_comment).permit(:comment)
  end
end
