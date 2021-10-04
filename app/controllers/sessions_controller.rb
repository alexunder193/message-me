# frozen_string_literal: true

# Login controller
class SessionsController < ApplicationController

  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    user = find_user
    if user_authenticate(user)
      # Authenticate once in next line and remain sign in for future requests
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      # Render not redirect to use flash[:notice]. Now we use flash.now[:error]
      flash.now[:error] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    # To logout make session's user id nil
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = 'You are already logged in'
      redirect_to root_path
    end
    return unless logged_in?
  end

  def user_authenticate(user)
    user&.authenticate(params[:session][:password])
  end

  def find_user
    User.find_by(username: params[:session][:username])
  end

end
