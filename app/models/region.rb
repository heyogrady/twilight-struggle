class Region < ActiveRecord::Base

  has_many :vicinities
  has_many :countries, through: :vicinities

end
