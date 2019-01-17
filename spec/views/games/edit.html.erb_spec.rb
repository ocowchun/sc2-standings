require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :winner_id => 1,
      :loser_id => 1,
      :note => "MyText",
      :winner_race => "MyString",
      :loser_race => "MyString"
    ))
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input[name=?]", "game[winner_id]"

      assert_select "input[name=?]", "game[loser_id]"

      assert_select "textarea[name=?]", "game[note]"

      assert_select "input[name=?]", "game[winner_race]"

      assert_select "input[name=?]", "game[loser_race]"
    end
  end
end
