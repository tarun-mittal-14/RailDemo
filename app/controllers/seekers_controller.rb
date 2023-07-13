class SeekersController < ApplicationController
 skip_before_action :authenticate_seeker,  only:[:create, :login ]
 skip_before_action :authenticate_recruiter


  def index
    seekers = Seeker.all
    render json: seekers
  end

  def show
    seeker = Seeker.find(params[:id])
    render json: seeker
    rescue ActiveRecord::RecordNotFound 
     render json: {message: "this id is not available"}
  end 

  def create
    seeker = Seeker.new(seeker_params)
    if 
      seeker.save
      render json: seeker
    else 
      render json: seeker.errors.full_messages
    end
  end


  def update
    seeker = @current_seeker
    seeker.update(seeker_params)
    render json:seeker  
    rescue ActiveRecord::RecordNotFound 
    render json: {message: "There is no seeker related to this id "} 
  end

  def login 
    seeker = Seeker.find_by(email: params[:email],password: params[:password])
    if seeker 
      token = jwt_encode(seeker_id: seeker.id)
      render json: {token: token}
    else
      render json: {error: "unauthorized access "}
    end
  end

  def search_job
    job = Job.where("title LIKE '%#{params[:title].strip}%'")
    return render json: job unless job.nil?
    render json: {message: "there is no job with this title"}
  end

  def apply_for_job
    seeker = JobSeeker.new(set_job)
    if seeker.save
      render json: {message: "Applied successful"}
    else
      render json: {message: "Failed"}
    end

  end

  def view_applied_jobs
    applied_jobs = JobSeeker.where(user_id: params[:id])
    render json: applied_jobs
    rescue ActiveRecord::RecordNotFound 
    render json: {message: "there is no job associated with thid id"}

  end

  private

  def set_job
   params.permit(:user_id,:job_id,:status)
 end


 def seeker_params
  params.permit(:name, :email, :password, :age, :experience, :qualification, :type, :image)
end
end
