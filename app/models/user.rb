class User < ApplicationRecord
  has_many :job_seekers
  has_many :jobs

  has_one_attached :image

  validates :name, :age, :email, :experience, :qualification, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 65 }
  validates :name, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                             message: 'only letters are allowed in name' }
  validates :password, length: { in: 6..15, message: 'Password must be between 8 to 15 characters' }
  validates :email, uniqueness: { message: 'Email is already exist' },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: '%<value>s not a valid email !!!' }
end
