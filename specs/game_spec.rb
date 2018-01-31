require('minitest/autorun')
require('minitest/rg')

require_relative('../game.rb')

class GameTest < MiniTest::Test

  def setup
    @player = Player.new("Chris")
    @game = Game.new(@player, "Political Correctness")

  end

  def test_game_has_player
    assert_equal(@player, @game.player)
  end
end
