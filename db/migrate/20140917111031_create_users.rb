class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.string :token
      t.string :role
      t.time :life_time

      t.timestamps
    end
  end
end
