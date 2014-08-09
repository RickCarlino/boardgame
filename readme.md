# Ruby 'boardgame' Gem

This library provides three classes for controlling logic in board games.

 * Create, move and track game pieces across tiles on a board
 * Automatic validation and boundary checking

# Installation

 1. `gem install boardgame`
 2. `require 'boardgame'`
 3. See usage instructions below

##Creating boards, pieces and tiles

```ruby
require 'boardgame'
# Create a 5x5 map.
map    = BoardGame::Map.new(5, 5)

# Get tiles
home_tile = map[2, 2]
# => #<BoardGame::Tile 0x123>

# Make a game piece
knight = BoardGame::Piece.new

#Put a piece on the board
home_tile << knight

#Move the game piece
knight.move_to map[0, 0]

#remove from the board
home_tile.remove(knight)
```
