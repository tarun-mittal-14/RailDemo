class User < ApplicationRecord
  
  has_many :job_seekers
  has_many :jobs

  has_one_attached :image

  validates :name, :age, :email, :experience, :qualification, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 65 }
  validates :name, format: { with: /\A[a-z]+(?: [a-z]+)?\z/,
                             message: 'only small letters are allowed in name' }
  validates :password, length: { in: 6..15, message: 'Password must be between 8 to 15 characters' }
  validates :email, uniqueness: { message: 'Email is already exist' },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: '%<value>s not a valid email !!!' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[age created_at email experience id name password qualification type updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob job_seekers jobs]
  end
end
