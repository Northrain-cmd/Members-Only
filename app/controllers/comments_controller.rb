class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post), success: 'Comment added'
    else
      render :new, alert: 'There was an error creating the comment'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), success: 'Comment updated!'
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy

    redirect_to post_path(post)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
