FactoryBot.define do
  factory :game do
    winner_id { 1 }
    loser_id { 1 }
    note { "MyText" }
    winner_race { "MyString" }
    loser_race { "MyString" }
  end
end
