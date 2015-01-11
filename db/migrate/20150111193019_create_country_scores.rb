class CreateCountryScores < ActiveRecord::Migration

  def change
    create_table :country_scores do |t|
      t.integer :us_influence, default: 0
      t.integer :ussr_influence, default: 0
      t.references :country, index: true
      t.references :game, index: true

      t.timestamps
    end
  end

end
