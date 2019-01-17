class Game < ApplicationRecord
  KNOWN_RACES = ['protoss', 'terran', 'zerg']
  belongs_to :winner, class_name: "User"
  belongs_to :loser, class_name: "User"

  validates_presence_of :winner_id
  validates_presence_of :loser_id
  validates_presence_of :winner_race
  validates_presence_of :loser_race
  validates_length_of :note, maximum: 5000

  validates_inclusion_of :winner_race, in: KNOWN_RACES
  validates_inclusion_of :loser_race, in: KNOWN_RACES
end
