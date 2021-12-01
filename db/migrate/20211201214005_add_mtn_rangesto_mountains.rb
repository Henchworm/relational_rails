class AddMtnRangestoMountains < ActiveRecord::Migration[5.2]
  def change
    add_reference :mountains, :mtn_range, foreign_key: true
  end
end
