class SquadsController < ApplicationController
  # def index
  # end

  def show
    squad = Squad.find(params[:id])
    @serialized_squad = SquadSerializer.show(squad)
  end

end
