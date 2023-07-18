class Job < ApplicationRecord
  belongs_to :user
  has_many :job_seekers

  validates :title, :description, :requirement, :location, presence: true

  validates :title, :description, :location, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                                                       message: 'only letters are allowed ' }
end
