# frozen_string_literal: true

class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :requirement, :location, :description
end
