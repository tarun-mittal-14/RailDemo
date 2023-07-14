class JobSeeker < ApplicationRecord
  belongs_to :user
  belongs_to :job

  # before_save :apply  

  validates :status, presence: true
  enum :status, [:approved, :rejected, :applied]

  # def apply
  #   self.status = "applied"
  # end
end
4