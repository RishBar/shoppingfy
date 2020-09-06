class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  # Confirms a logged-in emcee.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "what the hell bro, log in."
      redirect_to '/login'
    end
  end
end
