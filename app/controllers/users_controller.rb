class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t "users.user_nil"
    redirect_to action: :new
  end

  def create
    @user = User.new(user_params)
    return :new unless @user.save

    flash[:success] = t "users.success"
    redirect_to user_path id: @user.id
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
