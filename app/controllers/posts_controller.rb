class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), success: 'Post created successfully!'
    else
      render :new, alert: 'There was an error creating the post'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), success: 'Post created successfully!'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
