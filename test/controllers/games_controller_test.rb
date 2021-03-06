require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  def setup
    @game = games(:one)
    @patrick = users(:patrick)
    sign_in @patrick
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { player_us_id: @game.player_us_id, player_ussr_id: @game.player_ussr_id, status: @game.status }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { player_us_id: @game.player_us_id, player_ussr_id: @game.player_ussr_id, status: @game.status }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end

end
