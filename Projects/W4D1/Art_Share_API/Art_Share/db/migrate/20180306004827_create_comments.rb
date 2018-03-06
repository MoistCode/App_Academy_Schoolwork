class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commenter_id, null: false
      t.text :comment_body, null: false
      t.timestamps
    end
  end
end
