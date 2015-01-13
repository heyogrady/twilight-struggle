require "test_helper"

class GameTest < ActiveSupport::TestCase

  fixtures :users

  def setup
    @patrick = users(:patrick)
    @mike = users(:mike)
  end

  def test_setup_new_game
    @game = Game.create(player_us: @patrick, player_ussr: @mike)
    assert @game.tracker.present?, "Tracker not found"
    assert @game.country_scores.present?, "Country scores not found."
  end

end
