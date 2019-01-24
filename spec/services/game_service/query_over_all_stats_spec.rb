require 'rails_helper'
describe GameService::QueryOverAllStats do
  describe '#perform' do
    let!(:user1) { FactoryBot.create :user }
    let!(:user2) { FactoryBot.create :user }
    let!(:user3) { FactoryBot.create :user }
    let(:service) { GameService::QueryOverAllStats.new }
    before :each do
      FactoryBot.create :game, winner: user3, loser: user2
    end

    it "should return sorted_users" do
      res = service.perform

      expect(res[:sorted_users]).to eq([user3, user2, user1])
    end
  end
end
