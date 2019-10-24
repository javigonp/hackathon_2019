class UsersController < ApplicationController
  before_action :set_user, only: [:show, :squad_history]

  def index
    users = User.all
    @serialized_users = UserSerializer.index(users)
  end

  def show
    @serialized_user = UserSerializer.show(@user)
  end

  def squad_history
    squad_history = @user.user_squad_history_entries
    @serialized_squad_history = UserSquadHistorySerializer.index(squad_history)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
