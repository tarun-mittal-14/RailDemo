class UsersController < ApiController
  skip_before_action :authenticate_user

  def login
    user = User.find_by(email: params[:email], password: params[:password])
    if user
      token = jwt_encode(user_id: user.id)
      render json: { token: }
    else
      render json: { error: 'unauthorized user' }
    end
  end
end
