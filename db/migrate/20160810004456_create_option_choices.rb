class CreateOptionChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :option_choices do |t|
      t.string :choice
      t.references :response, foreign_key: true
    end
  end
end
