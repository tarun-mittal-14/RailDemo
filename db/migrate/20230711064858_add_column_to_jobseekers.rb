# frozen_string_literal: true

class AddColumnToJobseekers < ActiveRecord::Migration[7.0]
  def change
    add_column :job_seekers, :status, :string
  end
end
