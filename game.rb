require_relative "player"
require_relative "die"

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
      die = Die.new
      number_rolled = die.roll
      case number_rolled
      when 1..2
        p.blam
      when 3..4
        puts "#{p.name} was skipped."
      else
        p.w00t
      end
      puts p
    end
  end
end
