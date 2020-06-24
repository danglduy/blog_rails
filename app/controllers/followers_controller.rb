# frozen_string_literal: true

class FollowersController < ApplicationController
  before_action :find_user, only: :index

  def index
    @title = 'Followers'
    @users = @user.followers.paginate page: params[:page], per_page: 10
  end

  private

  def find_user
    @user = User.find_by id: params[:user_id]
  end
end
