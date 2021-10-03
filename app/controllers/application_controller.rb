# frozen_string_literal: true

# Helper methods for authentication
class ApplicationController < ActionController::Base

  # We put helper methods in those two def because we use them to views
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = 'You must be logged in to perform that action'
      redirect_to login_path
    end
    return if logged_in?
  end

end
