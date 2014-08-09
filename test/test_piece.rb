require_relative "test_helper"

class TestPiece < Minitest::Test
  def setup
    @map   = BoardGame::Map.new(5, 5)
    @piece = BoardGame::Piece.new
  end

  def test_inspect
    assert @piece.inspect == "+"
  end

  def test_move_to
    assert_raises RuntimeError do
      @piece.move_to [2, 2]
    end
    result = @piece.move_to @map[2,2]
    assert @piece.tile == @map[2, 2]
    assert @map[2,2].content.first == @piece
    assert result == @piece
    @piece.move_to @map[2,2]
    assert @piece.tile == @map[2,2]
  end
end