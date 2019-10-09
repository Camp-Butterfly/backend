class RemoveImagesOwnedFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :images_owned, :string
  end
end
