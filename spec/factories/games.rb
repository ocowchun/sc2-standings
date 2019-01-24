FactoryBot.define do
  factory :game do
    winner_id { 1 }
    loser_id { 1 }
    note { "zerg is good" }
    winner_race { "zerg" }
    loser_race { "zerg" }
  end
end
