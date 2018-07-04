class MasterController < ApplicationController

  def home
    if logged_in?
      @posts = current_user.feed.paginate(page: params[:page], per_page: 10)
      render 'feed'
    end
  end
  def help
  end

  def about
  end

  def contact
  end
end
