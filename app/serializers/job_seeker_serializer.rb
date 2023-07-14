# frozen_string_literal: true

class JobSeekerSerializer < ActiveModel::Serializer
  attributes :id, :status, :job, :user
end
