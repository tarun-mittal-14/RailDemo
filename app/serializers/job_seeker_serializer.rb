# frozen_string_literal: true

class JobSeekerSerializer < ActiveModel::Serializer
  attributes :id, :status, :title, :location, :requirement, :name, :email, :experience, :qualification

  def name
    object.user.name
  end

  def email
    object.user.email
  end

  def experience
    object.user.experience
  end

  def qualification
    object.user.qualification
  end

  def title
    object.job.title
  end

  def location
    object.job.location
  end

  def requirement
    object.job.requirement
  end
end
