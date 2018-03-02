class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :poll_question
      t.integer :poll_id
    end
  end
end
