class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
  before_action :find_user,      only: [:edit, :update, :show, :destroy,
    :following, :followers]
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @posts = @user.posts.paginate(page: params[:page], per_page: 10)
    @postpage = true
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "User deleted"
        redirect_back(fallback_location: root_path)
      end
      format.js do
        render file: "users/destroy.js.erb"
      end
    end
  end

  def following
    @title = "Following"
    @users = @user.following.paginate(page: params[:page], per_page: 10)
    render "show_follow"
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    render "show_follow"
  end

  private
  def user_params
    params.require(:user)
          .permit :name, :email, :password, :password_confirmation
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
