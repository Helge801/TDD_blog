class BlogsController < ApplicationController
  before_action :get_blog, only: [:show, :edit, :update]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @posts = @blog.post.all
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: 'Blog saved'
    else
      render :edit
    end
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to @blog, notice: 'Blog updated'
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :image)
  end

  def get_blog
    @blog = Blog.find(params[:id])
  end

end