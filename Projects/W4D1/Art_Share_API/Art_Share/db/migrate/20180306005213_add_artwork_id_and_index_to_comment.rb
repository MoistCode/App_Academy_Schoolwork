class AddArtworkIdAndIndexToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :artwork_id, :integer
    add_index :comments, [:artwork_id, :commenter_id]
  end
end
