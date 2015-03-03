require "studio_game/game"

module StudioGame
  RSpec.describe 'Game' do
  
    before do
      @game = Game.new("Knuckleheads")
    
      @initial_health = 10
      @player = Player.new("moe", @initial_health)
    
      @game.add_player(@player)
      @rounds = 2
    end
  
    it 'w00ts the player if a high number is rolled' do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
    
      @game.play(@rounds)
      expect(@player.health).to eq(@initial_health + (15 * @rounds))
    end
  
    it 'skips the player if a medium number is rolled' do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
    
    
      @game.play(@rounds)
      expect(@player.health).to eq(@initial_health)
    end
  
    it 'blams the player if a low number is rolled' do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
    
      @game.play(@rounds)
      expect(@player.health).to eq(@initial_health - (10 * @rounds))
    end
  
    it "assigns a treasure for points during a player's turn" do
      @game.play(1)
      expect(@player.points).to_not eq(0)
    end
  
    it 'computes total points as the sum of all player points' do
      game = Game.new("Test")
      player1 = Player.new("abc")
      player2 = Player.new("def")
      game.add_player(player1)
      game.add_player(player2)
    
      player1.found_treasure(Treasure.new(:hammer, 50))
      player1.found_treasure(Treasure.new(:hammer, 50))
      player2.found_treasure(Treasure.new(:crowbar, 400))
    
      expect(game.total_points).to eq(500)
    end
  
  end
end
