class CreateVicinities < ActiveRecord::Migration

  def change
    create_table :vicinities do |t|
      t.references :country, index: true
      t.references :region, index: true

      t.timestamps
    end
  end

end
