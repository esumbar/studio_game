require_relative '../lib/studio_game/game'
require_relative "../lib/studio_game/clumsy_player"
require_relative "../lib/studio_game/berserk_player"

knuckleheads = StudioGame::Game.new("Knuckleheads")
default_player_file = File.join(File.dirname(__FILE__), 'players.csv')
knuckleheads.load_players(ARGV.shift || default_player_file)

klutz = StudioGame::ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

berserker = StudioGame::BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  
  case answer
  when /^\d+$/
    rounds = Integer(answer)
    knuckleheads.play(rounds)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
  
end

knuckleheads.save_high_scores
