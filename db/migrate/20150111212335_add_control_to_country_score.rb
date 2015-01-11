class AddControlToCountryScore < ActiveRecord::Migration

  def change
    add_column :country_scores, :controlled_by, :string
  end

end
