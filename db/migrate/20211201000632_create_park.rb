class CreatePark < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :entrance_fee
      t.boolean :ocean_access

      t.timestamps
    end
  end
end
