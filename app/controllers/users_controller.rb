class UsersController < ApplicationController
  def index
    users = User.all
    @serialized_users = UserSerializer.index(users)
  end

  def show
    user = User.find(params[:id])
    @serialized_user = UserSerializer.show(user)
  end
end
