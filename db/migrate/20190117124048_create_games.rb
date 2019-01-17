class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :winner_id, null: false
      t.integer :loser_id, null: false
      t.text :note
      t.string :winner_race, null: false
      t.string :loser_race, null: false

      t.index :winner_id
      t.index :loser_id

      t.timestamps
    end
  end
end
