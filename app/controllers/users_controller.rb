class UsersController < ApplicationController
  before_action :authenticate_user!
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
       redirect_to user_path(current_user.id), notice: "You have created user successfully."
    else render :index
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "You have updated user successfully."
    else render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
