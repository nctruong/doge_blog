class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  private
  def link_params
    params.require(:post).permit(:title, :date)
  end
end
