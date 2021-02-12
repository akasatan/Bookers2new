class BooksController < ApplicationController

  def index
    @books = Book.all
    @new_book = Book.new
    @users = User.all
  end

  def create
    @new_book = Book.new(book_params) #新規投稿がここに来る
    @new_book.user_id = current_user.id #自分なら保存する？
    if   @new_book.save
       redirect_to book_path(@new_book), notice: "success book create."
    else render :index
    end
  end

  def edit
    @book = Book.find(params[:id]) #押されたIDをもらってくる
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book), notice: "success book update."
    else render :edit
    end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
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
