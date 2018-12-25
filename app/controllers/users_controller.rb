class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(index edit update destroy)
  before_action :admin_user, only: :destroy
  before_action :find_user, only: %i(edit update show destroy)
  before_action :correct_user, only: %i(edit update)

  def index
    @users = User.paginate page: params[:page], per_page: 10
  end

  def show
    @posts = @user.posts.paginate page: params[:page], per_page: 10
    @postpage = true
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "User deleted"
        redirect_back fallback_location: root_path
      end
      format.js do
        render file: "users/destroy.js.erb"
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to root_url, flash: {danger: "User not found"}
  end
end
