class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment_params = params.require(:comment).permit([:title, :description])
    @comment = Comment.new comment_params
    @post = Post.find params[:post_id]
    if @comment.save
      redirect_to post_comment_path(@post,@comment)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find params[:id]
  end

  def index
    @comments = Comment.order(created_at: :desc)
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_comments_path
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    comment_params = params.require(:comment).permit(:title, :description)

    if @comment.update comment_params
      redirect_to post_comment_path(@comment)
    else
      render :edit
    end
  end
end
