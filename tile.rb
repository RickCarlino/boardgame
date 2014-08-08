# A single tile on the map/board.
class Tile

  attr_reader :map, :contents, :x, :y

  def initialize(x = nil , y = nil)
    @contents, @x, @y = [], x, y
  end

  def inspect
    contents.empty? ? "." : "#"
  end

  def map=(map)
    raise 'Map must be a Map' unless map.is_a?(Map)
    @map = map
  end

  def add(piece)
    piece.tile = self
    @contents << piece
  end

  def left
    # has a map?
    # Within bounds?
    # return the tile.
    if map && map.within?((x - 1), y)
      map[(x - 1), y]
    else
      nil
    end
  end
end
