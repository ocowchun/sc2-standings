class GameSet < ApplicationRecord
  belongs_to :winner, class_name: "User"
  belongs_to :loser, class_name: "User"
  belongs_to :series

  validates_presence_of :winner_id
  validates_presence_of :loser_id
end
