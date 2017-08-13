class CreateCabins < ActiveRecord::Migration[5.1]
  def change
    create_table :cabins do |t|
      t.string :room, null: false
      t.string :level, null: false
      t.boolean :is_available, default: true
      t.belongs_to :ship, index: true, null: false
      t.timestamps
    end

    add_foreign_key :cabins, :ships
    add_index :cabins, [:room, :level], unique: true
  end
end
