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
end
