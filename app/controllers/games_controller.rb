class GamesController < InheritedResources::Base

  private

    def game_params
      params.require(:game).permit(:player_us_id, :player_ussr_id, :status)
    end
end

