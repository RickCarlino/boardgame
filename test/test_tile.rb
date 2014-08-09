require_relative "test_helper"

class TestTile < Minitest::Test
  def test_new
    assert BoardGame::Tile.new.is_a?(BoardGame::Tile),
      "Expected new tile to be."
  end

  def test_insertion
    tile  = BoardGame::Tile.new
    piece = BoardGame::Piece.new
    tile << piece
    assert tile.content.first == piece,
      "Did not put piece on tile."
  end

  def test_removal
    tile  = BoardGame::Tile.new
    piece = BoardGame::Piece.new
    tile << piece
    assert tile.content.first == piece,
      "Did not put piece on tile."
    tile.remove(piece)
    assert tile.content.length == 0,
      "Unable to remove pieces from tiles."
  end

  def test_inspect
    tile  = BoardGame::Tile.new
    assert tile.inspect == "□",
      "Expected empty tile to show □"
    piece = BoardGame::Piece.new
    tile << piece
    assert tile.inspect == piece.inspect,
      "Expected occupied tiles to show top piece when inspected."
  end

  def test_move_to
    map   = BoardGame::Map.new(2, 2)
    tile  = map[0, 0]
    piece = BoardGame::Piece.new
    tile << piece
    assert piece.tile == tile
    assert tile.x == 0
    assert tile.y == 0
    assert tile.map == map
    new_map = BoardGame::Map.new(2, 2)
    tile.move_to(1, 1, new_map)
    assert piece.tile == tile
    assert tile.x == 1
    assert tile.y == 1
    assert tile.map == new_map
    assert_raises RuntimeError do
      tile.move_to(2, 2)
    end 
  end
end