class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: session_params[:username])

    if @user && @user&.authenticate(session_params[:password])
      login!
      render json: {
        logged_in: true,
        user: @user
      }
    else
      render json: {
        errors: ['user not found', 'verify credentials and try again']
      }, status: 401
    end
  end

  def logged_in?
    if is_logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'user not found'
      }
    end
  end

  def destroy
    logout!
    render json: {
      logged_out: true
    }, status: 200
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
