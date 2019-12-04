class CreateButterflies < ActiveRecord::Migration[5.2]
  def change
    create_table :butterflies do |t|
      t.string :butterfly_name
      t.text :description

      t.timestamps
    end
  end
end
