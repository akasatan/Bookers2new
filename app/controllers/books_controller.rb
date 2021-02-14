class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @new_book = Book.new
    @users = User.all
  end

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if   @new_book.save
       redirect_to book_path(@new_book), notice: "You have created book successfully."
    else render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book), notice: "You have updated book successfully."
    else render :edit
    end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path
    else render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
