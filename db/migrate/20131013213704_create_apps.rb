class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string  :api_key
      t.integer :user_id
      t.string  :name
      t.string  :url
      t.boolean :verified
      
      t.timestamps
    end
  end
end
