class JobSeeker < ApplicationRecord
  belongs_to :user
  belongs_to :job


   validates :user_id, uniqueness: {scope: :job_id}
   # validates :status, presence: true
  # enum :status, %i[approved rejected applied]

  STATUS_OPTIONS = %w(approved rejected applied)

  validates :status, :inclusion => {:in => STATUS_OPTIONS}


  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id job_id status updated_at user_id]
  end
end
