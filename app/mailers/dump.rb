# frozen_string_literal: true
# def login
#   seeker = Seeker.find_by(email: params[:email], password: params[:password])
#   if seeker
#     token = jwt_encode(seeker_id: seeker.id)
#     render json: { token: }
#   else
#     render json: { error: 'unauthorized access ' }
#   end
# end

# def show
#   seeker = Seeker.find(params[:id])
#   render json: seeker
# rescue ActiveRecord::RecordNotFound
#   render json: { message: 'this id is not available' }
# end

# skip_before_action :authenticate_recruiter

# def login
#   puts 'login recruiter'
#   recruiter = Recruiter.find_by(email: params[:email], password: params[:password])
#   if recruiter
#     token = jwt_encode(recruiter_id: recruiter.id)
#     render json: { token: }
#   else
#     render json: { error: 'unauthorized user' }
#   end
# end

# def show
#   recruiter = Recruiter.find(params[:id])
#   render json: recruiter
# rescue ActiveRecord::RecordNotFound
#   render json: { message: 'this id is not available' }
# end

# skip_before_action :authenticate_seeker

# def authenticate_recruiter
#   puts 'authenticate_recruiter'
#   header = request.headers['Authorization']
#   header = header.split(' ').last if header
#   decoded = jwt_decode(header)
#   @current_recruiter = User.find(decoded[:recruiter_id])
# end

# def authenticate_seeker
#   puts 'authenticate_seeker'
#   header = request.headers['Authorization']
#   header = header.split(' ').last if header
#   decoded = jwt_decode(header)
#   @current_seeker = User.find(decoded[:seeker_id])
# end

# before_action :authenticate_recruiter
# before_action :authenticate_seeker

# validates :title, :description, :location, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
# message: 'only letters are allowed ' }
