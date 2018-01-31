require('minitest/autorun')
require('minitest/rg')

require_relative('../player.rb')

class PlayerTest < MiniTest::Test
  def setup
    @player = Player.new("Chris")

  end

  def test_player_has_name
    assert_equal("Chris", @player.name)
  end

  def test_player_has_lives__6
    assert_equal(6, @player.lives)
  end

  # def test_guess_letter
  #   assert_equal("q", @player.guess("q"))
  # end

  def test_lose_life
    @player.lose_life()
    assert_equal(5, @player.lives)
  end



end
