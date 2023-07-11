class JobSeeker < ApplicationRecord
  belongs_to :user
  belongs_to :job


  before_save :apply 


  def apply
    self.status = "applied"
  end
end
