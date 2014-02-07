class CommentsController < ApplicationController

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    authorize @comment
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: 'Comment was not saved successfully.'
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully approved.'
    else
      redirect_to @post, notice: 'Comment was NOT approved.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      redirect_to @post, notice: 'Comment annihilated!'
    else
      redirect_to @post, notice: 'Comment was not removed!'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, (:approved if CommentPolicy.new(current_user, @comment).approve?))
    end

    def user_not_authorized
      flash[:error] = "You must log in with Twitter to comment!"
      redirect_to request.headers["Referer"] || root_path
    end
end
