class CreateShortenedUrLs < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url, unique: true
      t.integer :user_id
      t.timestamps
    end
  end
end
