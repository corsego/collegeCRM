class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_invite_path_for(_resource)
    users_path
  end
end
