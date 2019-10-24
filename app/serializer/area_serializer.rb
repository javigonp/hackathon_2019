class AreaSerializer
  class << self
    def show(area)
      {
        id: area.id,
        name: area.name
      }
    end

    def index(areas)
      areas.map { |area| show(area) }
    end
  end
end
