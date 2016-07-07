class RemoveTitleToTasks < ActiveRecord::Migration
  def change
      remove_column :tasks, :title, :string
  end
end
