class UserSerializer < ActiveModel::Serializer
   attributes :id , :name, :qualification, :experience , :age ,:image

   def image
      object.image.url
   end

  # has_many :seekers
  # has_many :recruiters
  # has_many :jobs

end
