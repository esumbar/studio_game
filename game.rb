require_relative "player"
require_relative "game_turn"
require_relative "treasure_trove"

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end
  
  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong? }
    
    puts "\n#{@title} Statistics:"
    
    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |p|
      print_name_and_health(p)
    end
    
    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |p|
      print_name_and_health(p)
    end
    
    puts "\n#{@title} High Scores:"
    @players.sort.each do |p|
      puts "#{p.name.ljust(20, '.')} #{p.score}"
    end
  end
  
  def play(rounds)
    puts "\nThere are #{@players.size} players in #{@title}:"
    @players.each do |p|
      puts p
    end
    
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |t|
      puts "A #{t.name} is worth #{t.points} points"
    end
    
    1.upto(rounds) do |r|
      puts "\nRound #{r}:"
      @players.each do |p|
        GameTurn.take_turn(p)
      end      
    end
    
  end
end
