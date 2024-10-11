class BlogPostsController < ApplicationController
  # show all objects
  def index
    @blog_posts = BlogPost.all
  end

  # show a BlogPost object
  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # redirect_to root_path
    redirect_to "/"
  end

  # create new post form
  def new
    @blog_post = BlogPost.new
  end

  # Create new BlogPost object
  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      # redirect_to @blog_post
      redirect_to blog_post_path(@blog_post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Open edit a post form
  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  # Update a BlogPost object
  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete a BlogPost object
  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to root_path
  end

  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end


end
