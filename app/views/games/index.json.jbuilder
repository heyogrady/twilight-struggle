json.array!(@games) do |game|
  json.extract! game, :id, :player_us_id, :player_ussr_id, :status
  json.url game_url(game, format: :json)
end
