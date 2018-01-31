require('minitest/autorun')
require('minitest/rg')

require_relative('../game.rb')
require_relative('../player.rb')

class GameTest < MiniTest::Test

  def setup
    @player = Player.new("Chris")
    @game = Game.new(@player, "Political Correctness")

  end

  def test_game_has_player
    assert_equal(@player, @game.player)
  end

  def test_game_has_hidden_word
    assert_equal("Political Correctness", @game.hidden_word)
  end
end
