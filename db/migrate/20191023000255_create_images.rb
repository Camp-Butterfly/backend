class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_content
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
