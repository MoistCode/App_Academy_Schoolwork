class AddIndexToBandId < ActiveRecord::Migration[5.1]
  def change
    add_index :albums, :band_id
  end
end
