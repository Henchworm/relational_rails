class CreateHike < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name
      t.integer :mileage
      t.integer :elevation_gain
      t.boolean :water_on_route
      t.references :park, foreign_key: true

      t.timestamps
    end
  end
end
