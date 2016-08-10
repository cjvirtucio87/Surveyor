class CreateNumberChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :number_choices do |t|
      t.integer :choice
      t.references :response, foreign_key: true
    end
  end
end
