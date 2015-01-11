class GamesController < InheritedResources::Base

  before_action :load_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = current_user.games
  end

  def new
    @game = current_user.games.new
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game was successfully created." }
        format.json { render action: "show", status: :created, location: @game }
      else
        format.html { flash.now[:danger] = "Please check your entry and try again."
                      render :new
                    }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    render
  end

  def edit
    render
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_path, notice: "Game was successfully updated." }
        format.json { head :no_content }
      else
        format.html { flash.now[:danger] = "Please check your entry and try again."
                      render :edit
                    }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private

  def load_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:player_us_id,
                                 :player_ussr_id,
                                 :status
                                )
  end

end
