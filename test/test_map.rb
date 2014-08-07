require "test_helper"

class TestMap < Minitest::Test

  attr_reader :map

  def setup
    @map = Map.new(4, 4)
  end

  def test_new
    assert map.tiles.is_a?(Hash),
      "Expected new maps to have a tiles hash."
  end

  def test_set_tile
    map[1, 2] = Tile.new()
    assert map[1,2].is_a?(Tile),
      "Could not set tile on map."
    assert_raises RuntimeError do
      map[1, 2] = "Not a tile"
    end
    assert_raises RuntimeError do
      map[11, 4] = Tile.new
    end
    assert_raises RuntimeError do
      map[4, 11] = Tile.new
    end
  end

  def test_get_tile
    assert map[0, 1].is_a?(NullTile),
      "Lookups of empty tiles should return NullTile."
    map[1, 2] = Tile.new
    assert map[1,2].is_a?(Tile),
      "Could not set tile on map."
    assert_equal map[0,0].map, map,
      "Tile did not know where that it was owned by map `map`."
  end

  def test_inspect
    map[0, 0]   = Tile.new
    map[3, 3]   = Tile.new
    expectation = "\n"\
                  "#...\n"\
                  "....\n"\
                  "....\n"\
                  "...#\n"
    assert_equal map.inspect, expectation,
      "Maps dont look right in console."
  end
end