class CreateTrackers < ActiveRecord::Migration

  def change
    create_table :trackers do |t|
      t.integer :defcon_status, default: 5
      t.integer :victory_points, default: 0
      t.integer :action_round, default: 0
      t.integer :turn, default: 0
      t.integer :us_military_ops, default: 0
      t.integer :ussr_military_ops, default: 0
      t.integer :us_space_race, default: 0
      t.integer :ussr_space_race, default: 0
      t.references :game, index: true

      t.timestamps
    end
  end

end
