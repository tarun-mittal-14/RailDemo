class JobsController < ApiController
  before_action :check_recruiter

  def create_jobs
    job = @current_user.jobs.new(job_params)
    if job.save?
      render json: job
    else
      render json: job.errors.full_messages
    end
  end

  def view_all_jobs
    jobs = @current_user.jobs
    render json: jobs
  end

  def update
    job = @current_user.jobs.find(params[:id])
    job.update(job_params)
    render json: job
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  def view_job_applications
    applied_jobs = JobSeeker.where(job_id: @current_user.jobs.ids)
    render json: applied_jobs
  end

  def approve_job_applications
     approve_jobs = @current_user.jobs.find_by(job_id: params[:id]).job_seekers.find_by(params[:id])
     if approve_jobs.present?
      approve_jobs.approved!
    # approve_jobs.update
      render json: approve_jobs
      else 
        render json: {message: "You are not owner of this job"}
      end  
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  def view_approved_job_applications
    view_approved = JobSeeker.approved
    render json: view_approved
  end

  def reject_job_applications
    reject_jobs = JobSeeker.find(params[:id])
    reject_jobs.rejected!
    render json: reject_jobs
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  def view_rejected_job_applications
    view_rejected = JobSeeker.rejected
    render json: view_rejected
  end

  def job_delete
    job = @current_user.jobs.find(params[:id])
    job.destroy
    render json: { message: 'Job has been deleted' }
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  private

  def set_job
    Job.find(params[:id])
  end

  def view_all_jobs_params
    params.permit(:user_id)
  end

  def job_params
    params.permit(:title, :description, :location, :requirement, :user_id)
  end

  def check_recruiter
    if @current_user.type == 'Recruiter'
      # render json: { message: 'welcome' }
    else
      render json: { message: 'you are not authorized' }
    end
  end
end
