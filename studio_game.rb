class Player
  attr_accessor :name
  attr_reader :health
  
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end
  
  def name=(new_name)
    @name = new_name.capitalize
  end
  
  def score
    @health + @name.length
  end
  
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{self.score}."
  end
  
  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |p|
      puts p
    end
    @players.each do |p|
      p.blam
      p.w00t
      p.w00t
      puts p
    end
  end
end

player1 = Player.new("moe")
player2 = Player.new("lary", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

chipmunks = Game.new("Chipmunks")
chipmunks.add_player(Player.new("alvin"))
chipmunks.add_player(Player.new("simon", 12))
chipmunks.add_player(Player.new("theoore", 2))
chipmunks.play
