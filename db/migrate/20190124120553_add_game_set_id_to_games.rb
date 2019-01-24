class AddGameSetIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :game_set_id, :integer
    add_foreign_key :games, :game_sets, column: :game_set_id, primary_key: :id, on_delete: :cascade
  end
end
