class Game < ActiveRecord::Base

  belongs_to :player_us, class_name: "User", inverse_of: :us_games
  belongs_to :player_ussr, class_name: "User", inverse_of: :ussr_games

end
