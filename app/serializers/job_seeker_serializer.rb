class JobSeekerSerializer < ActiveModel::Serializer
  attributes :id ,   :status ,:job ,:user
end
