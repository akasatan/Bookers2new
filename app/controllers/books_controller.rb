class BooksController < ApplicationController

  def new
  end

  def index
    @books = Book.all
    @users = User.all
    @new_book = Book.new
    @user = current_user
  end

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @book = Book.find(params[:id])
    @user = current_user
    if @new_book.save
       redirect_to book_path(current_user.id), notice: "success book create."
    else render :show
    end
  end
  #エラーだったらだめと表示してindexへ
  #いいなら投稿してindexへにしたい。

  def edit
  end

  def update
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @new_book = Book.new
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
  #createが実行されるとbookテーブルのタイトルボディーが参照される。

end
