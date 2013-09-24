class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :f_name
      t.string :l_name
      t.string :phone
      t.string :password_digest
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_at
      t.string :verification_token
      t.boolean :verified
      t.string :last_4_digits
      t.string :stripe_id
      t.boolean :admin

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :verification_token
  end
end