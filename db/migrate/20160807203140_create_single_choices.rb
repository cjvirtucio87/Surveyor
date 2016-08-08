class CreateSingleChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :single_choices do |t|
      t.text :description
      t.integer :option_counter, default: 0

      t.timestamps
    end
  end
end
