class CreateNumberRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :number_ranges do |t|
      t.integer :min, default: 1
      t.integer :max, default: 5
      t.integer :selected, default: 5

      t.timestamps
    end
  end
end
