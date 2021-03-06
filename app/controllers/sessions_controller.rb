class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = t "users.success"
      redirect_to user_path id: @user.id
    else
      flash.now[:danger] = t "login.fail"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
