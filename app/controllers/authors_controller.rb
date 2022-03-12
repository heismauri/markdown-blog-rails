class AuthorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @author = User.friendly.find(params[:id])
    authorize @author
    @posts = Post.authored_by(@author)
  end
end
