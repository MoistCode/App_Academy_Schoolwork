class CreateArtwork < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, unique: true
      t.string :image_url, null: false
      t.integer :artist_id, null: false, unique: true
      t.timestamps
    end
  end
end
