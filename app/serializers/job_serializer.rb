# frozen_string_literal: true

class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :requirement, :location

  # belongs_to :user
end
