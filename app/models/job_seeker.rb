class JobSeeker < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :status, presence: true
  enum :status, %i[approved rejected applied]
end
