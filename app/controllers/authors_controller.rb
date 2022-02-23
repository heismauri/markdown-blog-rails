class AuthorsController < ApplicationController
  def show
    @author = User.friendly.find(params[:id])
    @posts = Post.authored_by(@author)
  end
end
