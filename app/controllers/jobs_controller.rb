class JobsController < ApplicationController
  before_action :check_recruiter

  def create_jobs
    # if @current_user.type == "recruiter"
    if (job = @current_user.jobs.create(job_params))
      render json: job
    else
      render json: job.errors.full_messages
    end
    # else
    #   render json: {mes}
    # end
  end

  def view_all_jobs
    jobs = @current_user.jobs
    render json: jobs
  end

  def job_update
    job = @current_user.jobs.find(params[:id])
    job.update(job_params)
    render json: job
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  def view_applied_jobs
    applied_jobs = JobSeeker.where(job_id: @current_user.jobs.pluck(:id))
    render json: applied_jobs
  end

  def approve_applied_jobs
    approve_jobs = JobSeeker.find(params[:id])
    approve_jobs.approved!
    render json: approve_jobs
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  def view_approved_jobs
    view_approved = JobSeeker.approved
    render json: view_approved
  end

  def reject_applied_jobs
    reject_jobs = JobSeeker.find(params[:id])
    reject_jobs.rejected!
    render json: reject_jobs
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  def view_rejected_jobs
    view_rejected = JobSeeker.approved
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
