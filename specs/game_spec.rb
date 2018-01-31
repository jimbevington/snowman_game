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

  def test_player_lose_life
    @game.player_lose_life
    assert_equal(5, @player.lives)
  end

  def test_game_won
    new_word = HiddenWord.new("a")
    new_game = Game.new(@player, new_word)
    new_word.update_display("a")

    assert_equal(true, new_game.won?)

  end

  def test_game_lost__false
  assert_equal(false, @game.lost?)
  end
  # we need to test if the game is lost_true

  def test_win_game__true
    @game.pass_guess_to_hidden_word("h")
    @game.pass_guess_to_hidden_word("i")
    @game.pass_guess_to_hidden_word("t")
    @game.pass_guess_to_hidden_word("h")
    @game.pass_guess_to_hidden_word("e")
    @game.pass_guess_to_hidden_word("r")
    @game.pass_guess_to_hidden_word("e")

    assert_equal(true, @game.won?)

  end

  def test_win_game__false
    @game.pass_guess_to_hidden_word("h")
    @game.pass_guess_to_hidden_word("i")
    @game.pass_guess_to_hidden_word("t")
    @game.pass_guess_to_hidden_word("h")
    @game.pass_guess_to_hidden_word("e")
    @game.pass_guess_to_hidden_word("r")


    assert_equal(false, @game.won?)

  end

end
