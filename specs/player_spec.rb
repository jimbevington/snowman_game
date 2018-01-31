require('minitest/autorun')
require('minitest/rg')

require_relative('../player.rb')

class PlayerTest < MiniTest::Test
  def setup
    @player = Player.new("Chris")

  end
  
end
