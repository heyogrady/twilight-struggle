json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :defcon_status, :victory_points, :action_round, :turn, :us_military_ops, :ussr_military_ops, :us_space_race, :ussr_space_race
  json.url tracker_url(tracker, format: :json)
end
