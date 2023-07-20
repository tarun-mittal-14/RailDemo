class JobSeeker < ApplicationRecord
  belongs_to :user
  belongs_to :job


  validates :user_id, uniqueness: {scope: :job_id}
  validates :status, presence: true

  enum status: { approved: 'approved', rejected: 'REJECTED', applied: 'APPLIED'}

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id job_id status updated_at user_id]
  end
  
end
