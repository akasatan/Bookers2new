class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @new_book = Book.new
  end
#current_userでUser(params[:id])と同じ意味になる
#devise導入によるもの

  def create
    @user = User.new(user_params)
    @user = current_user
    if @user.save
       redirect_to user_path(current_user.id), notice: "success book create."
    else render :index
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "success book update."
    else render :edit
    end
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = Book.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :setsumei, :my_image)
  end

end
