class ApiController < ActionController::API
  include JsonWebToken

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

   rescue_from CanCan::AccessDenied do | exception |
    render json: {message: exception}
  end

  rescue_from ActiveRecord::RecordNotFound do |exp|
    render json: { message: 'There is no Job related to this id ' }
  end
  before_action :authenticate_user

  def current_user
    @current_user
  end

  private

  def authenticate_user
    puts 'authenticate_user'
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
