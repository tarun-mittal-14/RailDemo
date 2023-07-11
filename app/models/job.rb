class Job < ApplicationRecord
  belongs_to :user

  validates :title, :description, :requirement, :location ,presence: true

  validates :title, :description, :location,  format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
    message: "only letters are allowed in name" }
end
