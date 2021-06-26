class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  alias_method :current_user, :user

  private

  def authenticate_user!
    if !authenticated?
      redirect_to login_path
    end
  end
end
