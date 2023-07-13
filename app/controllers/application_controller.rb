class ApplicationController < ActionController::API

  
	include JsonWebToken

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end
    
  before_action :authenticate_recruiter
  before_action :authenticate_seeker

  private

  def authenticate_recruiter
    puts "authenticate_recruiter"
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_recruiter = User.find(decoded[:recruiter_id])
  end

  def authenticate_seeker
    puts "authenticate_seeker"
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_seeker = User.find(decoded[:seeker_id])
  end
end
