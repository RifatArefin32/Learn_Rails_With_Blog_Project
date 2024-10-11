class JobPostsController < ApplicationController
  
  def index
    @job_posts = JobPost.all 
  end

  def show
    @job_post = JobPost.find(params[:id])
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(job_post_params)
    if @job_post.save
      redirect_to job_posts_path
    else
      render :new, status: :unprocessable_entity 
    end
  end


  private
  def job_post_params
    params.require(:job_post).permit(
      :title,
      :organization,
      :status,
      :salary,
      :work_days
    )
  end
end
