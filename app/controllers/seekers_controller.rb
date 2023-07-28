class SeekersController < ApiController
  skip_before_action :authenticate_user, only: [:create]
  load_and_authorize_resource except: [:create]

  def create
    seeker = Seeker.new(seeker_params)
    if seeker.save
      render json: seeker
    else
      render json: seeker.errors.full_messages
    end
  end

  def show
    render json: @current_user
  end

  def update
    @current_user.update(seeker_params)
    render json: { message: 'successfully updated' }
  end

  def search_job
    job = Job.where("title LIKE '%#{params[:title].strip}%'")
    return render json: job unless job.empty?
    render json: { message: 'there is no job with this title' }
  end

  def view_jobs
    jobs = Job.all
    render json: jobs
  end

  def apply_for_job
    seeker = @current_user.job_seekers.new(job_id: params[:job_id], status: 'applied')
    if seeker.save
      render json: { message: 'Applied successful' }
    else
      render json: { message: 'There is no Job related to this id ' }
    end
  end

  def view_applied_jobs
    applied_jobs = @current_user.job_seekers
    render json: applied_jobs
  end

  private

  def seeker_params
    params.permit(:name, :email, :password, :age, :experience, :qualification, :image)
  end

end
