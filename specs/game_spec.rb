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

  def test_guess_letter__not_present
    @game.guess_letter("z")
    assert_equal("** *****", @hidden_word.display)
    assert_equal(5, @player.lives)
    assert_equal(["z"], @game.guessed_letters)
  end

  def test_guess_letter__is_present
    @game.guess_letter("h")
    assert_equal("h* *h***", @hidden_word.display)
    assert_equal(6, @player.lives)
    assert_equal(["h"], @game.guessed_letters)
  end

  # ... in midst of building
  def test_parse_guess
    @game.parse_guess("jim")
    assert_equal(5, @player.lives)
  end



  # PASS A LETTER TO HIDDEN WORD
  def test_subtract_player_life
    @game.subtract_player_life
    assert_equal(5, @player.lives)
  end

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

  # HERE I'm CHECKING IF PARSE WILL KICK OFF THE RIGHT EVENT CHAIN
  # quite verbose
  def test_play_game_with_parse__full_word__true
    @game.parse_guess("hi there")
    assert_equal(true, @game.won?)
  end

  def test_play_game_with_parse__full_word__true
    @game.parse_guess("you there")
    assert_equal(false, @game.won?)
  end

  def test_play_game_with_parse__letters__true
    @game.parse_guess("e")
    @game.parse_guess("r")
    @game.parse_guess("h")
    @game.parse_guess("i")
    @game.parse_guess("t")
    assert_equal(true, @game.won?)
  end

  def test_play_game_with_parse__letters__false
    @game.parse_guess("e")
    @game.parse_guess("r")
    @game.parse_guess("h")
    @game.parse_guess("i")
    @game.parse_guess("l")
    assert_equal(false, @game.won?)
  end

end
