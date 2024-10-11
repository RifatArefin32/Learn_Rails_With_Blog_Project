class BlogPostsController < ApplicationController
  # show all objects
  def index
    @blog_posts = BlogPost.all
  end

  # show an object
  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # redirect_to root_path
    redirect_to "/"
  end

  # create new object
  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new
    end
  end


  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end


end
