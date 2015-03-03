require "studio_game/berserk_player"

module StudioGame
  describe 'BerserkPlayer' do
  
    before do
      @initial_health = 50
      @player = BerserkPlayer.new("berserk", @initial_health)
    end
  
    it 'does not go berserk when w00ted up to 5 times' do
      1.upto(5) { @player.w00t }
      expect(@player).not_to be_berserk
    end
  
    it 'goes berserk when w00ted more than 5 times' do
      1.upto(6) { @player.w00t }
      expect(@player).to be_berserk
    end
  
    it 'gets w00ted instead of blammed when it goes berserk' do
      1.upto(6) { @player.w00t }
      1.upto(2) { @player.blam }
      expect(@player.health).to eq(@initial_health + (8 * 15))
    end
  
  end
end
