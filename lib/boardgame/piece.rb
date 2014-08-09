# A piece on the board.
class BoardGame::Piece
  attr_accessor :tile

  def move_to(new_tile)
    raise 'that isnt a tile' unless new_tile.is_a? BoardGame::Tile
    @tile.remove self if @tile
    @tile = new_tile
    @tile << self
    self
  end

  def inspect
    "+"
  end
end