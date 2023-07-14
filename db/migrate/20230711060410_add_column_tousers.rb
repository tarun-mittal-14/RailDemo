# frozen_string_literal: true

class AddColumnTousers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string
  end
end
