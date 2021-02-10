class BooksController < ApplicationController

  def new
  end

  def create
    @books = Book.all
    @book = Book.new(toukou_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path,notice: "Book was successfully created."
    else
      render :index
    end
  end
  #エラーだったらだめと表示してindexへ
  #いいなら投稿してindexへにしたい。

  def index
    @books = Book.all
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def toukou_params
    params.require(:book).permit(:title, :body)
  end
  #createが実行されるとbookテーブルのタイトルボディーが参照される。

end
