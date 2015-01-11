require 'test_helper'

class CountryScoresControllerTest < ActionController::TestCase
  setup do
    @country_score = country_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_score" do
    assert_difference('CountryScore.count') do
      post :create, country_score: { country_id: @country_score.country_id, game_id: @country_score.game_id, us_influence: @country_score.us_influence, ussr_influence: @country_score.ussr_influence }
    end

    assert_redirected_to country_score_path(assigns(:country_score))
  end

  test "should show country_score" do
    get :show, id: @country_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_score
    assert_response :success
  end

  test "should update country_score" do
    patch :update, id: @country_score, country_score: { country_id: @country_score.country_id, game_id: @country_score.game_id, us_influence: @country_score.us_influence, ussr_influence: @country_score.ussr_influence }
    assert_redirected_to country_score_path(assigns(:country_score))
  end

  test "should destroy country_score" do
    assert_difference('CountryScore.count', -1) do
      delete :destroy, id: @country_score
    end

    assert_redirected_to country_scores_path
  end
end
