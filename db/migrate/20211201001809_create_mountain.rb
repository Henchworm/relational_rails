class CreateMountain < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.string :name
      t.integer :elevation
      t.boolean :safe_winter_route
      t.string :routes
      t.references :range, foreign_key: true

      t.timestamps
    end
  end
end
