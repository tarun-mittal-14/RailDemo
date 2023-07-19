# frozen_string_literal: true

class Seeker < User
  def self.ransackable_attributes(_auth_object = nil)
    %w[age created_at email experience id name password qualification type updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob job_seekers jobs]
  end
end
