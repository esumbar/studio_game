require_relative "player"

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
