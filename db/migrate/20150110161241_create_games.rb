class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_us_id
      t.integer :player_ussr_id
      t.string :status

      t.timestamps
    end
  end
end
