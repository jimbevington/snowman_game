require('minitest/autorun')
require('minitest/rg')

require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../hidden_word.rb')

class GameTest < MiniTest::Test

  def setup
    @player = Player.new("Chris")
    @hidden_word = HiddenWord.new("hi there")
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

  def test_game_pass_guess_to_hidden_word
    assert_equal(true, @game.pass_guess_to_hidden_word("h"))
    assert_equal(false, @game.pass_guess_to_hidden_word("a"))
  end

  def test_add_guess_to_guessed_letters
    @game.add_guess_to_guessed_letters("t")
    assert_equal(["t"], @game.guessed_letters)
  end

  def test_test_guess
    @game.test_guess(@hidden_word.true_false("a"))
    assert_equal(5, @player.lives)
  end

  def test_game_won
    new_word = HiddenWord.new("a")
    new_game = Game.new(@player, new_word)
    new_word.update_display("a")

    assert_equal(true, new_game.won?)

  end

end
