class AddImagesOwnedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :images_owned, :string
    add_index :users, :images_owned
  end
end
