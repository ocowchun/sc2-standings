class GameSetsController < ApplicationController
  before_action :authenticate_user!
  class InvalidGameSet < StandardError; end

  def new
    @series = Series.find(params[:series_id])
    @game_set = GameSet.new(winner: current_user)
    game_count = @series.game_count
    @games = game_count.times.map do |t|
      g = Game.new
      if t != @series.required_win_count
        g.winner_id = current_user.id
      end
      g
    end
    @candidates = User.all
  end

  def create
    @series = Series.find(params[:series_id])
    ActiveRecord::Base.transaction do
      @game_set = GameSet.new({
        winner: current_user,
        loser_id: extract_loser_id,
        series: @series,
        note: params[:note]
      })
      game_count = @series.game_count
      @games = game_count.times.map do |idx|
        game_params = {
          winner_id: params[:games][:winner_id][idx],
          loser_id: params[:games][:loser_id][idx],
          winner_race: params[:games][:winner_race][idx],
          loser_race: params[:games][:loser_race][idx]
        }
        Game.new(game_params)
      end
      validate_games!(@series.required_win_count)

      @game_set.save!
      winner_win = 0
      @games.each do |game|
        break if winner_win == @series.required_win_count
        game.game_set = @game_set
        winner_win = winner_win + 1 if game.winner_id.to_s == current_user.id.to_s
        game.save!
      end
    end
    redirect_to series_path(@series)
  rescue ActiveRecord::RecordInvalid, InvalidGameSet => e
    if e.class == InvalidGameSet
      @error_message = e.message
    end
    @candidates = User.all
    render :new
  end

  private

  def validate_games!(required_win_count)
    group = params[:games][:winner_id].group_by(&:to_s)
    if group[current_user.id.to_s].size != required_win_count
      raise InvalidGameSet, "Winner must and can only win #{required_win_count} game!"
    end

    if (params[:games][:winner_id] + params[:games][:loser_id]).reject(&:blank?).uniq.size != required_win_count
      raise InvalidGameSet, "One Game Set must and can only have #{required_win_count} gamer!"
    end
  end

  def extract_loser_id
    params[:games][:loser_id].uniq.find { |id| id != current_user.id.to_s }
  end
end
