class ApplicationController < ActionController::API
	include JsonWebToken
  before_action :authenticate_recruiter
    before_action :authenticate_seeker

  private
  def authenticate_recruiter
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_recruiter = User.find(decoded[:recruiter_id])
  end

  def authenticate_seeker
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_seeker = User.find(decoded[:seeker_id])
  end
end
