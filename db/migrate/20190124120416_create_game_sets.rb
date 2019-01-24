class CreateGameSets < ActiveRecord::Migration[5.1]
  def change
    create_table :game_sets do |t|
      t.integer :series_id, null: false
      t.integer :winner_id, null: false
      t.integer :loser_id, null: false
      t.text :note

      t.index :series_id
      t.index :winner_id
      t.index :loser_id

      t.timestamps
    end

    add_foreign_key :game_sets, :series, column: :series_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :game_sets, :users, column: :winner_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :game_sets, :users, column: :loser_id, primary_key: :id, on_delete: :cascade
  end
end
