class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def spamupdate
    Post.update_spam
    @posts = Post.all
    redirect_to posts_path
  end
end
