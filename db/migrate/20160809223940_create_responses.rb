class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :multi_choice
      t.string :single_choice
      t.integer :range
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
