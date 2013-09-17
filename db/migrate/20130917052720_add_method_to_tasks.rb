class AddMethodToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :method, :string
  end
end
