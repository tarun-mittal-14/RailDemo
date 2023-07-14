# frozen_string_literal: true

class RecruitersController < ApplicationController
  skip_before_action :authenticate_recruiter, only: %i[create login]
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
    render json: { message: 'this id is not available' }
  end

  def login
    puts 'login recruiter'
    recruiter = Recruiter.find_by(email: params[:email], password: params[:password])
    if recruiter
      token = jwt_encode(recruiter_id: recruiter.id)
      render json: { token: }
    else
      render json: { error: 'unauthorized user' }
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
    puts 'view jobs'
    job = @current_recruiter.jobs
    render json: job
  end

  def update
    recruiter = @current_recruiter
    recruiter.update(recruter_params)
    render json: recruiter
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no recruiter related to this id ' }
  end

  def job_update
    job = @current_recruiter.jobs.find(params[:id])
    job.update(job_params)
    render json: job
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no Job related to this id ' }
  end

  def view_applied_jobs
    applied_jobs = JobSeeker.where(job_id: @current_recruiter.jobs.pluck(:id))
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
    job = @current_recruiter.jobs.find(params[:id])
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

  def recruter_params
    params.permit(:name, :email, :password, :age, :experience, :qualification, :type, :image)
  end
end
