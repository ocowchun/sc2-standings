class Series < ApplicationRecord
  has_many :game_sets
  validates_presence_of :name
  validates_length_of :name, maximum: 100
end
