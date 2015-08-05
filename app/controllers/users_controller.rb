class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed up."
      # redirect_to "/profile"
      # refactored with route helpers:
      redirect_to profile_path
    else
      flash[:error] = user.errors.full_messages.join(', ')
      # redirect_to "/signup"
      # refactored with route helpers:
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(session[:user_id])
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end