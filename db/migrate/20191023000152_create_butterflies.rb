class CreateButterflies < ActiveRecord::Migration[5.2]
  def change
    create_table :butterflies do |t|
      t.string :butterfly_name
      t.string :scientific_name
      t.string :image_file_name
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
