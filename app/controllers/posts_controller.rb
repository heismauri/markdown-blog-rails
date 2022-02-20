class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_strong_params)
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit; end

  def update
    @post.update(post_strong_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_strong_params
    params.require(:post).permit(:title, :content, :thumbnail)
  end
end
