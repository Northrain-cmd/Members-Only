class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), success: 'Post created successfully!'
    else
      render :new, alert: 'There was an error creating the post'
    end
  end
end
