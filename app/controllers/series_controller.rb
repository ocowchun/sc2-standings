class SeriesController < ApplicationController
  def show
    @series = Series.find(params[:id])
    game_sets = @series.game_sets
    game_set_ids = game_sets.map(&:id)
    games = Game.includes(:winner, :loser).where(game_set_id: game_set_ids)

    users = (games.map(&:winner) + games.map(&:loser)).uniq
    @stats_map = users.map { |u| [u.id, { win: 0, lose: 0 }] }.to_h

    games.reduce(@stats_map) do |memo, game|
      memo[game.winner_id][:win] += 1
      memo[game.loser_id][:lose] += 1
      memo
    end

    @sorted_users = users.sort do |u1, u2|
      win_comparison = @stats_map[u2.id][:win] <=> @stats_map[u1.id][:win]
      no_win = @stats_map[u1.id][:win] + @stats_map[u2.id][:win] == 0
      if win_comparison != 0
        win_comparison
      elsif no_win
        @stats_map[u2.id][:lose] <=> @stats_map[u1.id][:lose]
      else
        @stats_map[u1.id][:lose] <=> @stats_map[u2.id][:lose]
      end
    end
  end
end
