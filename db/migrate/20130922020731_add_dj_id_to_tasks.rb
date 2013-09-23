class AddDjIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :dj_id, :integer
  end
end
