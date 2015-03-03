require "csv"

require_relative "player"
require_relative "game_turn"
require_relative "treasure_trove"

module StudioGame
  class Game
    attr_reader :title
  
    def initialize(title)
      @title = title
      @players = []
    end

    def load_players(player_file)
      CSV.foreach(player_file) do |line|
        name, health = line
        self.add_player(Player.new(name, Integer(health)))
      end
    end
  
    def formatted_high_score(player)
      "#{player.name.ljust(20, '.')} #{player.score}"
    end
  
    def save_high_scores(high_scores_file="high_scores.txt")
      File.open(high_scores_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |p|
          file.puts self.formatted_high_score(p)
        end
      end
    end
  
    def add_player(player)
      @players << player
    end
  
    def total_points
      @players.reduce(0) {|sum, p| sum + p.points}
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
    
      @players.each do |p|
        puts "\n#{p.name}'s points total:"
        puts "#{p.points} grand total points"
      end
    
      @players.sort.each do |p|
        puts "\n#{p.name}'s point totals:"
        p.each_found_treasure do |t|
          puts "#{t.points} total #{t.name} points"
        end
        puts "#{p.points} grand total points"
      end
    
      puts "\n#{self.total_points} total points from treasures found"
    
      puts "\n#{@title} High Scores:"
      @players.sort.each do |p|
        puts self.formatted_high_score(p)
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
        if block_given?
          break if yield
        end
      end
    end
  
  end
end
