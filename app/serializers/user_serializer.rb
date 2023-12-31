class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :qualification, :experience, :age, :image

  def image
    object.image.url
  end
end
