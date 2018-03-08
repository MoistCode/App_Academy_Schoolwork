class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.string :status, null: false
    end
    add_index :albums, :title
  end
end
