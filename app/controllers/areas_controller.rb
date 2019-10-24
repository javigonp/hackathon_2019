class AreasController < ApplicationController
  def index
    areas = Area.all
    @serialized_areas = AreaSerializer.index(areas)
  end
end
