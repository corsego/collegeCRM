class UsersController < ApplicationController

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

end