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

  def test_is_a_word__true
    assert_equal(true, @game.is_a_word?("hi there"))
  end

  def test_is_a_word__false
    assert_equal(false, @game.is_a_word?("h"))
  end

  def test_correct_word__true
    assert_equal(true, @game.correct_word?("hi there"))
  end

  def test_correct_word__false
    assert_equal(false, @game.correct_word?("cheese"))
  end

  def test_parse_guess
    assert_equal(true, @game.parse_guess("hi there"))
  end

  # PASS A LETTER TO HIDDEN WORD

  def test_game_won__false
    assert_equal(false, @game.won?)
  end

  def test_game_won__true
    word = HiddenWord.new("aaa")
    game = Game.new("Chris", word)
    word.update_display("a") # provide only present letter
    assert_equal(true, game.won?)
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
