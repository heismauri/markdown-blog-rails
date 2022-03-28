class AuthorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @author = User.friendly.find(params[:id])
    authorize @author
    @pagy, @posts = pagy(Post.authored_by(@author), items: 6)
  end
end
