class FixOrderCounter < ActiveRecord::Migration[5.0]
  def change
    rename_column :single_choices, :option_counter, :options_count
    rename_column :multi_choices, :option_counter, :options_count
    rename_column :surveys, :question_counter, :questions_count
  end
end
