class HomeController < ApplicationController
  def index
  end

  def standings
    res = GameService::QueryOverAllStats.new.perform
    @sorted_users = res[:sorted_users]
    @stats_map = res[:stats_map]
  end
end
