class CreateMountain < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.string :name
      t.integer :elevation
      t.boolean :safe_winter_route

      t.timestamps
    end
  end
end
