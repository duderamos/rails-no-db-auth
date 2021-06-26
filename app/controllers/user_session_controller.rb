class UserSessionController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    flash[:alert] = warden.message unless warden.message.blank?
    redirect_back(fallback_location: root_path) if authenticated?
  end

  def create
    authenticate!
    redirect_to root_path
  end

  def destroy
    logout
    redirect_to root_path
  end
end
