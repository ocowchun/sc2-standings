json.extract! game, :id, :winner_id, :loser_id, :note, :winner_race, :loser_race, :created_at, :updated_at
json.url game_url(game, format: :json)
