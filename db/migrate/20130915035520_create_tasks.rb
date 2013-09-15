class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :url
      t.datetime :exec_time
      t.boolean :executed
      t.string :app_token
      t.timestamps
    end
  end
end
