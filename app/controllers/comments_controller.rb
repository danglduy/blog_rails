class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:destroy]
  before_action :find_commentable
  before_action :find_comment, only: [:destroy]
  before_action :new_comment, only: [:create]
  before_action :prevent_nested_comment, only: [:create]

  def create
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = "Your comment was successfully posted!"
          redirect_back(fallback_location: root_path)
        end
        format.js
      end
    else
      flash[:danger] = @comments.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "Comment deleted"
        redirect_back(fallback_location: root_path)
      end
      format.js
    end
  end

  private
  def correct_user
    @comment = Comment.find_by(id: params[:id])
    @commentuser = @comment.user
    @postuser = @comment.commentable.user
    return if (current_user != (@commentuser || @postuser)) ||
              !current_user.admin?
    redirect_to(root_url)
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def find_commentable
    @commentable = if params[:comment_id]
                     Comment.find_by(id: params[:comment_id])
                   elsif params[:post_id]
                     Post.find_by(id: params[:post_id])
                   end
  end

  def find_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def new_comment
    @comment = @commentable.comments.build(comment_params)
  end

  def prevent_nested_comment
    return unless (new_comment.commentable.is_a? Comment) &&
                  (new_comment.commentable.commentable.is_a? Comment)
    flash[:danger] = "Nested comment is not permitted!"
    redirect_back(fallback_location: root_path)
  end
end
