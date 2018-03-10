class CreateExampleModels < ActiveRecord::Migration[5.1]
  def change
    create_table :example_models do |t|

      t.timestamps
    end
  end
end
