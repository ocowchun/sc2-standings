require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:winner) }
  it { should belong_to(:loser) }
  it { should validate_presence_of(:winner_id) }
  it { should validate_presence_of(:loser_id) }
  it { should validate_presence_of(:winner_race) }
  it { should validate_presence_of(:loser_race) }
  it { should validate_inclusion_of(:winner_race).in_array(Game::KNOWN_RACES) }
  it { should validate_inclusion_of(:loser_race).in_array(Game::KNOWN_RACES) }
end
