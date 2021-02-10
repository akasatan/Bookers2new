class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @book = Book.new
    @book = Book.new(kitei_params)
    @book.save
    redirect_to books_path
  end

  def update
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @user = User.all
    @books = Book.all
  end

  private

  def kitei_params
    params.require(:user).permit(:name, :setsumei, :my_image_id)
  end

end
