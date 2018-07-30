class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit,
                                            :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def show
    @comments = @post.comments.paginate(page: params[:page], per_page: 10)
    @comment = @post.comments.build(user_id: current_user.id) if user_signed_in?
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to user_path(current_user)
    else
      messages = ""
      @post.errors.each do |key, value|
        message = "#{key}" + ": " + "#{value}" unless value == nil
        unless message == nil then messages = "#{messages}" + "#{message}. "
        end
      end
      flash[:danger] = messages unless messages == ""
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      # redirect_to user_path(current_user)
      redirect_to post_path(@post)
    else
      messages = ""
      @post.errors.each do |key, value|
        message = "#{key}" + ": " + "#{value}" unless value == nil
        unless message == nil then messages = "#{messages}" + "#{message}. "
        end
      end
      flash[:danger] = messages unless messages == ""
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {
        flash[:success] = "Post deleted"
        redirect_back(fallback_location: root_path)
      }
      format.js {
        render file: "posts/destroy.js.erb"
      }
    end
  end


  private

  def find_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.required(:post).permit(:title, :content)
  end
end
