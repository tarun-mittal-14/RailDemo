class RecruitersController < ApplicationController
 skip_before_action :authenticate_recruiter,  only:[:create, :login]
 skip_before_action :authenticate_seeker

   def create
    @recruiter = Recruiter.new(recruter_params)
    if @recruiter.save
      render json: @recruiter, status: :ok 
    else 
      render json: {error: "Unable to create profile"}
    end
  end

  def login 
    @recruiter = Recruiter.find_by(email: params[:email],password: params[:password])
    if @recruiter 
      token = jwt_encode(recruiter_id: @recruiter.id)
      render json: {token: token}, status: :ok 
    else
      render json: {error: "unauthorized"}, status: :unauthorized
    end
  end


  def create_jobs
    @job = @current_recruiter.jobs.new(job_params)
    if @job.save 
      render jason: @job, status: :ok 
    else
      render json: {error: "unable to create job"}
    end
  end

  def view_all_jobs
    @job = @current_recruiter.jobs 
    render json: @job
  end

  def job_update

    @job = @current_recruiter.jobs.find(params[:id])
    if @job.update(job_params)
      render json:@job
    else
      render json: {errors: @job.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def approve_applied_jobs
    a = JobSeeker.find_by(id: params[:id])
    a.update(status: "approved")
    render json: a
  end

  def job_delete
    @job = @current_recruiter.jobs.find(params[:id])
    if @job.destroy
      render json: {message: "Job has been deleted"}
    else
      render json: {message: "There is no Job related to this id "}
    end
  end

  
  private

  def set_job
    @job = Job.find(params[:id])
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



