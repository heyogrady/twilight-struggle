require "test_helper"

class CountryScoreTest < ActiveSupport::TestCase

  fixtures :games, :countries

  def test_us_controlled_true
    mexico = countries(:mexico)
    game = games(:patrick_vs_mike)
    mexico_score = CountryScore.create!(country: mexico,
                                        game: game,
                                        us_influence: 10,
                                        ussr_influence: 0
                                       )
    assert_equal true, mexico_score.us_controlled?
  end

  def test_us_controlled_false
    mexico = countries(:mexico)
    game = games(:patrick_vs_mike)
    mexico_score = CountryScore.create!(country: mexico,
                                        game: game,
                                        us_influence: 0,
                                        ussr_influence: 0
                                       )
    assert_equal false, mexico_score.us_controlled?
  end

  def test_ussr_controlled_true
    mexico = countries(:mexico)
    game = games(:patrick_vs_mike)
    mexico_score = CountryScore.create!(country: mexico,
                                        game: game,
                                        us_influence: 0,
                                        ussr_influence: 10
                                       )
    assert_equal true, mexico_score.ussr_controlled?
  end

  def test_ussr_controlled_false
    mexico = countries(:mexico)
    game = games(:patrick_vs_mike)
    mexico_score = CountryScore.create!(country: mexico,
                                        game: game,
                                        us_influence: 10,
                                        ussr_influence: 0
                                       )
    assert_equal false, mexico_score.ussr_controlled?
  end

end
