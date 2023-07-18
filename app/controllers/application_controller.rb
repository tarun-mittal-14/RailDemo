class ApplicationController < ActionController::API
  include JsonWebToken

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  before_action :authenticate_user

  private

  def authenticate_user
    puts 'authenticate_user'
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
