class SquadsController < ApplicationController
  def index
    squads = Squad.all
    @serialized_squads = SquadSerializer.index(squads)
  end

  def show
    squad = Squad.find(params[:id])
    @serialized_squad = SquadSerializer.show(squad)
  end

end
