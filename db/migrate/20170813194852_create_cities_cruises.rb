class CreateCitiesCruises < ActiveRecord::Migration[5.1]
  def change
    create_table :cities_cruises, id: false do |t|
      t.belongs_to :city, index: true, null: false
      t.belongs_to :cruise, index: true, null: false
    end
  end
end