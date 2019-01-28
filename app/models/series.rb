class Series < ApplicationRecord
  has_many :game_sets

  validates_presence_of :name
  validates_length_of :name, maximum: 100
  validate :validate_game_count

  def required_win_count
    (game_count / 2) + 1
  end

  private

  def validate_game_count
    if game_count < 1
      errors.add(:game_count, "game count must > 0")
    elsif game_count.even?
      errors.add(:game_count, "game count must be odd")
    end
  end
end
