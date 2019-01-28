class Game < ApplicationRecord
  KNOWN_RACES = ['protoss', 'terran', 'zerg', 'random']
  belongs_to :winner, class_name: "User"
  belongs_to :loser, class_name: "User"
  belongs_to :game_set, required: false

  validates_presence_of :winner_id
  validates_presence_of :loser_id
  validates_presence_of :winner_race
  validates_presence_of :loser_race
  validates_length_of :note, maximum: 5000

  validates_inclusion_of :winner_race, in: KNOWN_RACES
  validates_inclusion_of :loser_race, in: KNOWN_RACES

  validate :validate_same_user

  private

  def validate_same_user
    if winner_id.to_s == loser_id.to_s
      errors.add(:loser_id, "loser should be different with winner")
    end
  end
end
