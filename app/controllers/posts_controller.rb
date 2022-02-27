class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show search]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_strong_params)
    authorize @post
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

  def search
    @query = params[:query]
    @posts = Post.search_by_title_and_content(@query)
    authorize @posts
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
    authorize @post
  end

  def post_strong_params
    params.require(:post).permit(:title, :content, :thumbnail)
  end
end
