#._________.
#|  0123 X |  Example 4X4 map,
#| 0....   |  with a piece
#| 1..#.   |  placed in (2, 1)
#| 2....   |
#| 3....   |
#| Y       |
class Map

  attr_reader :tiles, :height, :width

  def initialize(height, width)
    @height, @width = height, width
    validate_height
    initialize_map_tiles
  end

  def [](x, y)
    validate_coords(x, y)
    return @tiles[x][y]
  end

  def []=(x, y, tile)
    validate_coords(x, y)
    raise 'needs to be a tile' unless tile.is_a? Tile
    @tiles[x][y] = tile
    tile.map     = self
    return tile
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

  def place(piece, x, y)
    if self[x, y].add piece
      return true
    else
      return false
    end
  end

private

  def initialize_map_tiles
    @tiles = {}
    0.upto(max_x) do |wd|
      @tiles[wd] = {}
      0.upto(max_y) do |ht|
        new_tile(wd, ht)
      end
    end
  end

  def new_tile(x, y)
    validate_coords(x, y)
    tile = (@tiles[x][y] = Tile.new(x, y))
    tile.map = self
  end

  def max_x
    width - 1
  end

  def max_y
    height - 1
  end

  def validate_coords(x, y)
    raise 'x must be an Fixnum' unless x.is_a? Fixnum
    raise "#{x} is not within map width of #{width}" if (x < 0) || (x > max_x)
    raise 'y must be an Fixnum' unless y.is_a? Fixnum
    raise "#{y} is not within map height of #{height}" if (y < 0) || (y > max_y)
  end

  def within?(x, y)
    within_x = (x < 0) || (x > max_x)
    within_y = (y < 0) || (y > max_y)
    (within_y && within_y)
  end

  def validate_height
    unless height.is_a?(Fixnum) && width.is_a?(Fixnum)
      raise 'Expected height and width to be Fixnums'
    end
  end
end