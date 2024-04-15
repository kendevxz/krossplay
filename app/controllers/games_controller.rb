class GamesController < ApplicationController
  def index
    @games = IgdbService.search_games(params[:query])
    render json: @games
  end
end
