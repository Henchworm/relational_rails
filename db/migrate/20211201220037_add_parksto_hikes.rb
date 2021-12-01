class AddParkstoHikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :hikes, :park, foreign_key:true 
  end
end
