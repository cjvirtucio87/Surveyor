class AddColumnToNumberRange < ActiveRecord::Migration[5.0]
  def change
    add_column :number_ranges, :description, :text
  end
end
