class CountriesController < InheritedResources::Base

  private

  def country_params
    params.require(:country).permit(:name,
                                    :stability,
                                    :battleground,
                                    vicinities_attributes: [:id,
                                                            :region
                                                           ],
                                    connections_attributes: [:id,
                                                             :neighbor,
                                                             :inter_regional,
                                                             :superpower
                                                            ]
                                   )
  end

end
