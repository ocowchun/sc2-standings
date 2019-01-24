class GameService::QueryOverAllStats < Service
  def perform
    users = User.all
    stats_map = users.map { |u| [u.id, { win: 0, lose: 0 }] }.to_h
    Game.includes(:winner, :loser).all.reduce(stats_map) do |memo, game|
      memo[game.winner_id][:win] += 1
      memo[game.loser_id][:lose] += 1
      memo
    end

    # sorting rule
    # most wins first
    # if both wins = 0, most games first
    # otherwise less lose first
    sorted_users = users.sort do |u1, u2|
      win_comparison = stats_map[u2.id][:win] <=> stats_map[u1.id][:win]
      no_win = stats_map[u1.id][:win] + stats_map[u2.id][:win] == 0
      if win_comparison != 0
        win_comparison
      elsif no_win
        stats_map[u2.id][:lose] <=> stats_map[u1.id][:lose]
      else
        stats_map[u1.id][:lose] <=> stats_map[u2.id][:lose]
      end
    end

     {
      sorted_users: sorted_users,
      stats_map: stats_map
     }
  end
end