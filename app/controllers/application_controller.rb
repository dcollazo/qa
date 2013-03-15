class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method [:current_user, :logged_in?]

  protected # to prevent access as actions

  def login(user)
  	session[:user_id] = user.id
  end

  def current_user
  	current_user ||= User.find(session[:user_id]) if session[:user_id] # returns current logged-in user (if one is set), or find the user in the db using the id session
  end

  def logged_in?
  	!current_user.nil?
  end

  def auth
  	redirect_to login_url, alert: 'You must be logged in' unless logged_in?
  end
end
