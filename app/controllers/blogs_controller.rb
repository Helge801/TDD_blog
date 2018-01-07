class BlogsController < ApplicationController
  before_action :get_blog, only: [:show]

  def index
    @blogs = Blog.all
  end

  def new
  end

  def show
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :image)
  end

  def get_blog
    @blog = Blog.find(params[:id])
  end

end