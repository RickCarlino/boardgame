require "test_helper"

class TestTile < Minitest::Test
  def test_new
    assert Tile.new.is_a?(Tile),
      "Expected new tile to be."
  end
end