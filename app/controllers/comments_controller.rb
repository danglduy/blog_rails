class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:destroy]
  before_action :find_commentable

  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.commentable_type == "Post" || @comment.commentable.commentable_type != "Comment"
      if @comment.save
        flash[:success] = "Your comment was successfully posted!"
        redirect_back(fallback_location: root_path)
      else
        messages = ""
        @comment.errors.each do |key, value|
          message = "#{key}" + ": " + "#{value}" unless value == nil
          unless message == nil then messages = "#{messages}" + "#{message}. "
          end
        end
        flash[:danger] = messages unless messages == ""
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = "Nested comment is not permitted!"
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    flash[:success] = "Comment deleted"
    redirect_back(fallback_location: root_path)
  end

  private

  def correct_user
    @comment = Comment.find_by(id: params[:id])
    @commentuser = @comment.user
    @postuser = @comment.commentable.user
    unless (current_user == @commentuser) || (current_user == @postuser) || current_user.admin? then
      redirect_to(root_url)
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def find_commentable
    @commentable = Comment.find_by(id: params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by(id: params[:post_id]) if params[:post_id]
  end
end
