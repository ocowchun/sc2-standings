require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :winner_id => 2,
      :loser_id => 3,
      :note => "MyText",
      :winner_race => "Winner Race",
      :loser_race => "Loser Race"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Winner Race/)
    expect(rendered).to match(/Loser Race/)
  end
end
