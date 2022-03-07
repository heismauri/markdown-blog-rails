class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @posts = Post.take(5)
  end
end
