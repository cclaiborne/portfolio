class CommentsController < ApplicationController
  before_filter :load_commentable
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def index
    @comments = @commentable.comments
  end

  def create
    #@post = Post.find(params[:post_id])
    @comment = @commentable.comments.build(comment_params)
    authorize @comment
    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: 'Comment was not saved successfully.'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully approved.'
    else
      redirect_to @post, notice: 'Comment was NOT approved.'
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    #@post = @comment.post
    if @comment.destroy
      redirect_to @commentable, notice: 'Comment deleted'
    else
      redirect_to @commentable, notice: 'Comment was not deleted'
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

    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
  end
end
