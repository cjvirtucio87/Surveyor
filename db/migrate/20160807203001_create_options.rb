class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :description
      t.boolean :selected, default: false
      t.references :optionable, polymorphic: true

      t.timestamps
    end
  end
end
