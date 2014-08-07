require "test_helper"

class TestTile < Minitest::Test
  def test_new
    assert tile.new.is_a?(Tile),
      "Expected new tile to be."
  end
end