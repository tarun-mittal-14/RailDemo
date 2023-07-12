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

  def login 
    seeker = Seeker.find_by(email: params[:email],password: params[:password])
    if seeker 
      token = jwt_encode(seeker_id: seeker.id)
      render json: {token: token}
    else
      render json: {error: "unauthorized access "}
    end
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
  	a = JobSeeker.find(params[:id])
  	a.job
    render json: a
    rescue ActiveRecord::RecordNotFound 
    render json: {message: "there is no job associated with thid id"}

  end

  private

  def set_job
   params.permit(:user_id,:job_id,:status)
 end


 def seeker_params
  params.permit(:name, :email, :password, :age, :experience, :qualification, :type)
end
end
