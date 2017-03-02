class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if params[:commit] == "generate"
      generated_password = Devise.friendly_token.first(8)
      @user.password = generated_password
    end
    if @user.save
      flash[:success] = "Successfuly saved."
    else
      flash[:error] = "Something went wrong."
    end

    RegistrationMailer.welcome(@user, generated_password).deliver if params[:submit] == "generate"
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Deleted!"
    else
      flash[:error] = "Something went wrong."
    end
    redirect_to users_path
  end

  private

  def authenticate_admin!
    if current_user.try(:admin?)
      true
    else
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
