class CountryScoresController < InheritedResources::Base

  private

  def country_score_params
    params.require(:country_score).permit(:us_influence,
                                          :ussr_influence,
                                          :country_id,
                                          :game_id,
                                          :controlled_by
                                         )
  end

end

