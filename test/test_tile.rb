require "test_helper"

class TestTile < Minitest::Test
  def test_new
    assert Tile.new.is_a?(Tile),
      "Expected new tile to be."
  end

  def test_insertion
    tile  = Tile.new
    piece = Piece.new
    tile << piece
    assert tile.content.first == piece,
      "Did not put piece on tile."
  end
end