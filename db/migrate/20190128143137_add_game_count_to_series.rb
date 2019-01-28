class AddGameCountToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :game_count, :integer, default: 3
  end
end
