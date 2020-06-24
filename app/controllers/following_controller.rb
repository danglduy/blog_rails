# frozen_string_literal: true

class FollowingController < ApplicationController
  before_action :find_user, only: :index

  def index
    @title = 'Following'
    @users = @user.following.paginate page: params[:page], per_page: 10
  end

  private

  def find_user
    @user = User.find_by id: params[:user_id]
  end
end
