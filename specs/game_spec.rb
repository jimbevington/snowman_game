require('minitest/autorun')
require('minitest/rg')

require_relative('../game.rb')
require_relative('../player.rb')

class GameTest < MiniTest::Test

  def setup
    @player = Player.new("Chris")
    @hidden_word = HiddenWord.new("Political Correctness")
    @game = Game.new(@player, @hidden_word)


  end

  def test_game_has_player
    assert_equal(@player, @game.player)
  end

  def test_game_has_hidden_word
    assert_equal(@hidden_word, @game.hidden_word)
  end

  def test_game_guessed_letters__none
    assert_equal([], @game.guessed_letters)
  end
end
