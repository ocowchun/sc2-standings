class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @games = Game.includes(:winner, :loser)
      .where('winner_id = :user_id or loser_id = :user_id', user_id: @user.id)
      .order('created_at desc')
  end
end
