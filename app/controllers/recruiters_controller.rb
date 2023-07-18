class RecruitersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :check_recruiter, except: [:create]

  def create
    recruiter = Recruiter.new(recruiter_params)
    if recruiter.save
      render json: recruiter
    else
      render json: recruiter.errors.full_messages
    end
  end

  def index
    render json: @current_user
  end

  def update
    recruiter = @current_user
    recruiter.update(recruiter_params)
    render json: recruiter
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'There is no recruiter related to this id ' }
  end

  private

  def recruiter_params
    params.permit(:name, :email, :password, :age, :experience, :qualification, :image)
  end

  def check_recruiter
    if @current_user.type == 'Recruiter'
      # render json: { message: 'welcome' }
    else
      render json: { message: 'you are not authorized' }
    end
  end
end
