class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :photo, null: false
      t.timestamps
    end

    add_index :cities, [:name], unique: true
  end
end
