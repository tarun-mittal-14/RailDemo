class SeekersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :check_seeker, except: [:create]

  def create
    seeker = Seeker.new(seeker_params)
    if seeker.save
      render json: seeker
    else
      render json: seeker.errors.full_messages
    end
  end

  def index
    render json: @current_user
  end

  def update
    seeker = @current_user
    seeker.update(seeker_params)
    render json: seeker
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no seeker related to this id ' }
  end

  def search_job
    job = Job.where("title LIKE '%#{params[:title].strip}%'")
    return render json: job unless job.nil?

    render json: { message: 'there is no job with this title' }
  end

  def view_jobs
    jobs = Job.all
    render json: jobs
  end

  def apply_for_job
    seeker = JobSeeker.new(apply_job)
    if seeker.save
      render json: { message: 'Applied successful' }
    else
      render json: { message: 'Failed' }
    end
  end

  def view_applied_jobs
    applied_jobs = JobSeeker.where(user_id: params[:id])
    render json: applied_jobs
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'there is no job associated with thid id' }
  end

  private

  def seeker_params
    params.permit(:name, :email, :password, :age, :experience, :qualification, :image)
  end

  def apply_job
    params.permit(:user_id, :job_id, :status)
  end

  def check_seeker
    if @current_user.type == 'Seeker'
      # render json: { message: 'welcome' }
    else
      render json: { message: 'you are not authorized' }
    end
  end
end
