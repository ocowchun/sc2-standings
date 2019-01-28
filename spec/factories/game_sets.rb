FactoryBot.define do
  factory :game_set do
    winner { FactoryBot.create :user }
    loser { FactoryBot.create :user }
    note { "zerg is good" }
    series { FactoryBot.create :series }
  end
end
