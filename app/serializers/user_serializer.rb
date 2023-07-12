class UserSerializer < ActiveModel::Serializer
   attributes :id , :name, :qualification, :experience , :age

  # has_many :seekers
  # has_many :recruiters
  # has_many :jobs

end
