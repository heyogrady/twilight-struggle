json.array!(@country_scores) do |country_score|
  json.extract! country_score, :id, :us_influence, :ussr_influence, :country_id, :game_id
  json.url country_score_url(country_score, format: :json)
end
