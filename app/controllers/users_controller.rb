class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      # UserMailer.signup_confirmation(@user.id).deliver
      redirect_to admin_path, notice: "You've successfully signed up!"
    else
      flash[:errors] = @user.errors.messages
      render 'session/sign_in'
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
