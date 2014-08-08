map    = Map.new(4, 4)
player = Piece.new
map.place(player, 2, 1)
player.move(:up)