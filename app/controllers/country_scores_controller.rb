class CountryScoresController < InheritedResources::Base

  before_action :load_country_score, only: [:show, :edit, :update, :destroy]

  def index
    @country_scores = CountryScore.all
  end

  def new
    @country_score = CountryScore.new
  end

  # def create
  #   @country_score = CountryScore.new(country_score_params)

  #   respond_to do |format|
  #     if @country_score.save
  #       format.html { redirect_to @country_score, notice: "Country score was successfully created." }
  #       format.json { render action: "show", status: :created, location: @country_score }
  #     else
  #       format.html { flash.now[:danger] = "Please check your entry and try again."
  #                     render :new
  #                   }
  #       format.json { render json: @country_score.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def show
    render
  end

  def edit
    render
  end

  # def update
  #   respond_to do |format|
  #     if @country_score.update(country_score_params)
  #       format.html { redirect_to @country_score, notice: "Country score was successfully updated." }
  #       format.json { head :no_content }
  #     else
  #       format.html { flash.now[:danger] = "Please check your entry and try again."
  #                     render :edit
  #                   }
  #       format.json { render json: @country_score.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @country_score.destroy
    respond_to do |format|
      format.html { redirect_to country_scores_url }
      format.json { head :no_content }
    end
  end

  private

  def load_country_score
    @country_score = CountryScore.find(params[:id])
  end

  def country_score_params
    params.require(:country_score).permit(:us_influence,
                                          :ussr_influence,
                                          :country_id,
                                          :game_id,
                                          :controlled_by
                                         )
  end

end

