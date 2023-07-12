class RecruitersController < ApplicationController
 skip_before_action :authenticate_recruiter,  only:[:create, :login]
 skip_before_action :authenticate_seeker

   def create
    recruiter = Recruiter.new(recruter_params)
    if recruiter.save
      render json: recruiter
    else 
      render json: recruiter.errors.full_messages
    end
  end

  def index
    recruiters = Recruiter.all
    render json: recruiters
  end

  def show
    recruiter = Recruiter.find(params[:id])
    render json: recruiter
    rescue ActiveRecord::RecordNotFound 
     render json: {message: "this id is not available"}
  end 


  def login 
    recruiter = Recruiter.find_by(email: params[:email],password: params[:password])
    if recruiter 
      token = jwt_encode(recruiter_id: recruiter.id)
      render json: {token: token}
    else
      render json: {error: "unauthorized user"}
    end
  end


  def create_jobs
    job = @current_recruiter.jobs.new(job_params)
    if job.save 
      render json: job
    else
      render json: job.errors.full_messages
    end
  end

  def view_all_jobs
    job = @current_recruiter.jobs 
    render json: job
  end

  def job_update
    job = @current_recruiter.jobs.find(params[:id])
    job.update(job_params)
    render json:job  
    rescue ActiveRecord::RecordNotFound 
    render json: {message: "There is no Job related to this id "} 
  end


  def approve_applied_jobs
    a = JobSeeker.find_by(id: params[:id])
    a.update(status: "approved")
    render json: a
    rescue ActiveRecord::RecordNotFound 
    render json: {message: "There is no Job related to this id "}
  end

  def job_delete
    job = @current_recruiter.jobs.find(params[:id])
    job.destroy
    render json: {message: "Job has been deleted"}
    rescue ActiveRecord::RecordNotFound 
    render json: {message: "There is no Job related to this id "}
  end

  
  private

  def set_job
    job = Job.find(params[:id])
  end  

  def view_all_jobs_params
    params.permit(:user_id)
  end

  def job_params
    params.permit(:title, :description , :location, :requirements, :user_id)
  end

  def recruter_params
    params.permit(:name, :email, :password, :age, :experience, :qualification, :type)
  end
  
end



