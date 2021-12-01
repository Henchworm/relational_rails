class CreateRange < ActiveRecord::Migration[5.2]
  def change
    create_table :ranges do |t|
      t.string :name
      t.string :accessibility
      t.boolean :natl_park_land
      t.integer :drivetime

      t.timestamps
    end
  end
end
