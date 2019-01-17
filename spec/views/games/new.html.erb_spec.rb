require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :winner_id => 1,
      :loser_id => 1,
      :note => "MyText",
      :winner_race => "MyString",
      :loser_race => "MyString"
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input[name=?]", "game[winner_id]"

      assert_select "input[name=?]", "game[loser_id]"

      assert_select "textarea[name=?]", "game[note]"

      assert_select "input[name=?]", "game[winner_race]"

      assert_select "input[name=?]", "game[loser_race]"
    end
  end
end
