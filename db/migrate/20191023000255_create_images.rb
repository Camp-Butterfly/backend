class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_name
      t.string :butterfly_name
      t.string :location
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
