class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
    else
        render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Update success profile"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
