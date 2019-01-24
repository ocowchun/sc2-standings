class AddFkToGames < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :games, :users, column: :winner_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :games, :users, column: :loser_id, primary_key: :id, on_delete: :cascade
  end
end
