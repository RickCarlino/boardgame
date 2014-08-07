# A single tile on the map/board.
class Tile

  attr_reader :map

  def initialize
  end

  def inspect
    "#"
  end

  def map=(map)
    raise 'Map must be a Map' unless map.is_a?(Map)
    @map = map
  end
end
