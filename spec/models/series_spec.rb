require 'rails_helper'

RSpec.describe Series, type: :model do
  it { should have_many(:game_sets) }
  it { should validate_presence_of(:name) }

  describe "validate_game_count" do
    it "return false when game count < 1" do
      s = FactoryBot.build :series, game_count: 0

      expect(s.valid?).to eq(false)
    end

    it "return false when game count is even" do
      s = FactoryBot.build :series, game_count: 2

      expect(s.valid?).to eq(false)
    end
  end
end
