class TrackersController < InheritedResources::Base

  private

    def tracker_params
      params.require(:tracker).permit(:defcon_status, :victory_points, :action_round, :turn, :us_military_ops, :ussr_military_ops, :us_space_race, :ussr_space_race)
    end
end

