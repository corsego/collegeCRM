class UsersController < ApplicationController

  before_action :require_admin, only: [:edit, :update, :ban, :destroy]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def resend_confirmation_instructions
    @user = User.find(params[:id])
    unless @user.confirmed?
      @user.resend_confirmation_instructions
      redirect_to @user, notice: "Confirmation instructions were resent"
    else
      redirect_to @user, alert: "User already confirmed"
    end
  end

  def ban
    @user = User.find(params[:id])
    if @user.access_locked?
      @user.unlock_access!
    else
      @user.lock_access!
    end
    redirect_to @user, notice: "User access locked: #{@user.access_locked?}"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully destroyed."
  end

  private

  def user_params
    params.require(:user).permit(*User::ROLES)
  end

  def require_admin
    # unless current_user.admin? || current_user.teacher?
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to perform this action"
    end
  end

end