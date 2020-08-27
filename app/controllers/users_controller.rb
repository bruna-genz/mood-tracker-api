class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: 'created',
        user: @user
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end

  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        errors: ['no users found']
      }, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
