require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :winner_id => 2,
        :loser_id => 3,
        :note => "MyText",
        :winner_race => "Winner Race",
        :loser_race => "Loser Race"
      ),
      Game.create!(
        :winner_id => 2,
        :loser_id => 3,
        :note => "MyText",
        :winner_race => "Winner Race",
        :loser_race => "Loser Race"
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Winner Race".to_s, :count => 2
    assert_select "tr>td", :text => "Loser Race".to_s, :count => 2
  end
end
