class CreateConnections < ActiveRecord::Migration

  def change
    create_table :connections do |t|
      t.integer :country_id, index: true
      t.integer :neighbor_id, index: true
      t.boolean :inter_regional, default: false
      t.boolean :superpower, default: false

      t.timestamps
    end
  end

end
