# A single tile on the map/board.
class BoardGame::Tile

  attr_accessor :content, :x, :y, :map

  def initialize(x: nil , y: nil, map: nil, content: [])
    @content, @x, @y, @map = content, x, y, map
  end

  def move_to(x, y, map = @map)
    if map.within? x, y
      @x, @y, @map = x, y, map
    else
      raise 'invalid move'
    end
    self
  end

  def inspect
    content.empty? ? "□" : content.last.inspect
  end

  def <<(piece)
    piece.tile = self
    @content << piece
  end

  def remove(piece)
    piece.tile = nil
    @content.delete piece
  end

  def as_json(*args)
    {x: @x,
     y: @y,
     content: @content}
  end
end
