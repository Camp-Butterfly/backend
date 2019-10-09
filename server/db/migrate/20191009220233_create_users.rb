class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :username
      t.string :password
      t.string :images_owned

      t.timestamps
    end
    add_index :users, :images_owned
  end
end
