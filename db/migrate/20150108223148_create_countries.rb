class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :stability
      t.boolean :battleground

      t.timestamps
    end
  end
end
