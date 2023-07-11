class RenameColInJobs < ActiveRecord::Migration[7.0]
  def change
     rename_column :jobs, :tittle, :title 
  end
end
