# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :tittle
      t.text :description
      t.text :requirement
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
