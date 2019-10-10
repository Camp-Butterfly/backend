class AddScientificNameToButterflies < ActiveRecord::Migration[5.2]
  def change
    add_column :butterflies, :scientific_name, :string
  end
end
