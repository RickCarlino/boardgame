require "test_helper"

class TestMap < Minitest::Test

  def map
    @map ||= Map.new(4, 4)
  end

  def test_new
    assert map.tiles.is_a?(Hash),
      "Expected new maps to have a tiles hash."
  end

  def test_within
    assert map.within?(2, 2),
      "Within did not identify coords within bounds"
    assert map.within?(0, 0),
      "Within did not identify coords within bounds"
    refute map.within?(-1, 0),
      "Within did not identify coords within bounds"
    refute map.within?(4, 4),
      "Within did not identify coords outside bounds"
    refute map.within?(5, 5),
      "Within did not identify coords outside bounds"
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
    assert map[0, 1].is_a?(Tile),
      "Lookups of tiles should return Tile."
    map[1, 2] = Tile.new
    assert map[1,2].is_a?(Tile),
      "Could not set tile on map."
    assert_equal map[0,0].map, map,
      "Tile did not know where that it was owned by map `map`."
  end

  def test_inspect
    map[0, 0]   = Tile.new
    map[3, 3]   = Tile.new
    map[2, 1] << Piece.new
    expectation = "\n"\
                  "□□□□\n"\
                  "□□+□\n"\
                  "□□□□\n"\
                  "□□□□\n"
    assert_equal map.inspect, expectation,
      "Maps dont look right in console."
  end
end