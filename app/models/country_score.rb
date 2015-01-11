class CountryScore < ActiveRecord::Base

  belongs_to :country
  belongs_to :game

  validates :country, :game, presence: true

  def us_controlled?
    us = us_influence
    ussr = ussr_influence
    stability = country.stability
    us >= stability && us >= ussr + stability
  end

  def ussr_controlled?
    us = us_influence
    ussr = ussr_influence
    stability = country.stability
    ussr >= stability && ussr >= us + stability
  end

end
