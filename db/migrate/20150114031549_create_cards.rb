class CreateCards < ActiveRecord::Migration

  def change
    create_table :cards do |t|
      t.string :name
      t.string :title
      t.text :description
      t.string :phase
      t.integer :ops_points, default: 0
      t.boolean :remove_after_event, default: false
      t.boolean :display_after_event, default: false
      t.string :side, default: "both"
      t.boolean :prevent_in_headline, default: false
      t.boolean :always_evaluate_first, default: false
      t.integer :card_number

      t.timestamps
    end
  end

end
