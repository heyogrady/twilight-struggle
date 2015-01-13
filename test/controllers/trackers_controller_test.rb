require 'test_helper'

class TrackersControllerTest < ActionController::TestCase
  setup do
    @tracker = trackers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracker" do
    assert_difference('Tracker.count') do
      post :create, tracker: { action_round: @tracker.action_round, defcon_status: @tracker.defcon_status, turn: @tracker.turn, us_military_ops: @tracker.us_military_ops, us_space_race: @tracker.us_space_race, ussr_military_ops: @tracker.ussr_military_ops, ussr_space_race: @tracker.ussr_space_race, victory_points: @tracker.victory_points }
    end

    assert_redirected_to tracker_path(assigns(:tracker))
  end

  test "should show tracker" do
    get :show, id: @tracker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracker
    assert_response :success
  end

  test "should update tracker" do
    patch :update, id: @tracker, tracker: { action_round: @tracker.action_round, defcon_status: @tracker.defcon_status, turn: @tracker.turn, us_military_ops: @tracker.us_military_ops, us_space_race: @tracker.us_space_race, ussr_military_ops: @tracker.ussr_military_ops, ussr_space_race: @tracker.ussr_space_race, victory_points: @tracker.victory_points }
    assert_redirected_to tracker_path(assigns(:tracker))
  end

  test "should destroy tracker" do
    assert_difference('Tracker.count', -1) do
      delete :destroy, id: @tracker
    end

    assert_redirected_to trackers_path
  end
end
