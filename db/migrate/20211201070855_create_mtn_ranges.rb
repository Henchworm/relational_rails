class CreateMtnRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :mtn_ranges do |t|
      t.string :name
      t.boolean :natl_park_land
      t.integer :drivetime

      t.timestamps
    end
  end
end
