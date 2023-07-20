class Job < ApplicationRecord
  belongs_to :user
  has_many :job_seekers , dependent: :destroy

  validates :title, :description, :requirement, :location, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description id location requirement title updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[job_seekers user]
  end
end
