class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:destroy]
  def create
    post = Post.find_by(id: params[:post_id])
    @comment = post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to post_path(post)
    else
      messages = ""
      @comment.errors.each do |key, value|
        message = "#{key}" + ": " + "#{value}" unless value == nil
        unless message == nil then messages = "#{messages}" + "#{message}. "
        end
      end
        flash[:danger] = messages unless messages == ""
        redirect_to post_path(@comment.post)
    end
  end


  def destroy
    comment = Comment.find_by(id: params[:id])
    post = comment.post
    comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to post_url(post)
  end

  private

  def correct_user
    @comment = Comment.find_by(id: params[:id])
    @commentuser = @comment.user
    @postuser = @comment.post.user
    unless current_user == @commentuser || current_user == @postuser || current_user.admin? then
      redirect_to(root_url)
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end


end
