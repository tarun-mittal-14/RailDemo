class JobseekerSerializer < ActiveModel::Serializer
  attributes :id , :user

  # def user
  #   object.user.name 
  # end

  # belongs_to :job
  belongs_to :user
end
