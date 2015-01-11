class Country < ActiveRecord::Base

  has_many :vicinities
  has_many :regions, through: :vicinities
  has_many :connections
  has_many :neighbors, through: :connections
  has_many :country_scores

  accepts_nested_attributes_for :vicinities
  accepts_nested_attributes_for :connections

end
