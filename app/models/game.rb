class Game < ActiveRecord::Base

  belongs_to :player_us, class_name: "User", inverse_of: :us_games
  belongs_to :player_ussr, class_name: "User", inverse_of: :ussr_games

  has_many :country_scores, dependent: :destroy
  has_one :tracker, dependent: :destroy

  validates :player_us, :player_ussr, presence: true

  after_create :setup_new_game

  scope :user_is_participant, ->(user) { where("(player_us_id = ?) OR (player_ussr_id = ?)", user, user) }

  private

  def setup_new_game
    initialize_tracker
    initialize_country_scores
  end

  def initialize_tracker
    Tracker.create!(game: self)
  end

  def initialize_country_scores
    countries = Country.all
    countries.each do |country|
      CountryScore.create!(game: self, country: country)
    end
  end

end
