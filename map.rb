class Map

  attr_reader :tiles, :height, :width

  def initialize(height, width)
    @height, @width = (height - 1), (width - 1)
    validate_height
    initialize_map_tiles
  end

  def [](x, y)
    check_x(x)
    check_y(y)
    return @tiles[x][y]
  end

  def []=(x, y, tile)
    check_x(x)
    check_y(y)
    raise 'needs to be a tile' unless tile.is_a? Tile
    @tiles[x][y] = tile
    tile.map     = self
    return tile
  end

  def inspect
    buffer = "\n"
    0.upto(width) do |wd|
      0.upto(height) do |ht|
        buffer += self[wd, ht].inspect
      end
      buffer += "\n"
    end
    return buffer
  end

private

  def initialize_map_tiles
    @tiles = {}
    0.upto(width) do |wd|
      @tiles[wd] = {}
      0.upto(height) do |ht|
        @tiles[wd][ht] = NullTile.new
      end
    end
  end

  def check_x(x)
    raise 'x must be an Fixnum' unless x.is_a? Fixnum
    raise "x is not within map width of #{width}" if (x < 0) || (x > width)
  end

  def check_y(y)
    raise 'y must be an Fixnum' unless y.is_a? Fixnum
    raise "y is not within map height of #{height}" if (y < 0) || (y > height)
  end

  def validate_height
    unless height.is_a?(Fixnum) && width.is_a?(Fixnum)
      raise 'Expected height and width to be Fixnums'
    end
  end
end