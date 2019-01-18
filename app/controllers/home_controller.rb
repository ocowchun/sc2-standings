class HomeController < ApplicationController
  def index
  end

  def standings
    users = User.all
    @stats_map = users.map { |u| [u.id, { win: 0, lose: 0 }] }.to_h
    Game.includes(:winner, :loser).all.reduce(@stats_map) do |memo, game|
      memo[game.winner_id][:win] += 1
      memo[game.loser_id][:lose] += 1
      memo
    end
    @sorted_users = users.sort_by { |u| @stats_map[u.id][:win] * -1 }
  end
end
