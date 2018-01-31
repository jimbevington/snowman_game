require('minitest/autorun')
require('minitest/rg')

require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../hidden_word.rb')

class GameTest < MiniTest::Test

  ### SETUP ############################################

  def setup
    @player = Player.new("Chris")
    @hidden_word = HiddenWord.new("hi there")
    @game = Game.new(@player, @hidden_word)
  end

  ### TESTS ############################################

  ### test parameters ##################################

  def test_game_has_player
    assert_equal(@player, @game.player)
  end

  def test_game_has_hidden_word
    assert_equal(@hidden_word, @game.hidden_word)
  end

  def test_game_guessed_letters__none
    assert_equal([], @game.guessed_letters)
  end

  ### test methods ##################################

  def test_add_guess_to_guessed_letters
    @game.add_guess_to_guessed_letters("t")
    assert_equal(["t"], @game.guessed_letters)
  end

  # PASS A LETTER TO HIDDEN WORD
  # CHECK IF GAME WON
  # CHECK IF GAME LOST

def test_game_won__false
  # something in here
  assert_equal(false, @game.won?)
end

  def test_game_lost__false
  assert_equal(false, @game.lost?)
  end

  # can shorten this
  def test_game_lost__true
  @player.lose_life
  @player.lose_life
  @player.lose_life
  @player.lose_life
  @player.lose_life
  @player.lose_life
  assert_equal(true, @game.lost?)
  end


end
