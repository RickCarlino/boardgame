#._________. A simple board / map of tiles
#|  0123 X | =============================
#| 0....   | Example 4X2 map,
#| 1..#.   | with a piece
#| Y       | placed in (2, 1)
#`---------'
class BoardGame::Map

  attr_reader :tiles, :height, :width

  def initialize(height, width)
    @height, @width = height, width
    validate_height
    initialize_map_tiles
  end
  
  # Retrieves a tile for a given X/Y coord.
  def [](x, y)
    return @tiles[x][y] if within? x, y
  end

  # Sets a tile for a given X/Y coord.
  def []=(x, y, tile)
    validate_coords(x, y)
    raise 'needs to be a tile' unless tile.is_a? BoardGame::Tile
    @tiles[x][y] = tile.move_to(x, y, self)
  end

  # Determine if x and y values are within the limits of the map.
  def within?(x, y)
    (x >= 0) && (x < height) && (y >= 0) && (y < height)
  end

  def inspect
    buffer = "\n"
    0.upto(max_y) do |ht|
      0.upto(max_x) do |wd|
        buffer += self[wd, ht].inspect
      end
      buffer += "\n"
    end
    return buffer
  end

private

  def initialize_map_tiles
    @tiles = {}
    0.upto(max_x) do |wd|
      @tiles[wd] = {}
      0.upto(max_y) do |ht|
        self[wd, ht] = BoardGame::Tile.new({})
      end
    end
  end

  def max_x
    width - 1
  end

  def max_y
    height - 1
  end

  def validate_coords(x, y)
    raise "Coords out of range for #{height}x#{width} map." unless within? x, y
  end

  def validate_height
    unless height.is_a?(Fixnum) && width.is_a?(Fixnum)
      raise 'Expected height and width to be Fixnums'
    end
  end
end