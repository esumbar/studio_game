require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("lary", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(3)
knuckleheads.print_stats

chipmunks = Game.new("Chipmunks")
chipmunks.add_player(Player.new("alvin"))
chipmunks.add_player(Player.new("simon", 12))
chipmunks.add_player(Player.new("theodore", 2))
chipmunks.play(3)
chipmunks.print_stats
