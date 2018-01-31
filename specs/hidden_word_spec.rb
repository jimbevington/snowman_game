require('minitest/autorun')
require('minitest/rg')


require_relative('../game.rb')
require_relative('../hidden_word.rb')
require_relative('../player.rb')


class HiddenWordTest < MiniTest::Test
  def setup
    @hidden_word = HiddenWord.new("hi there")
    @player = Player.new("Chris")
    @game = Game.new(@player, @hidden_word)
  end

  def test_has_word
    assert_equal("hi there", @hidden_word.word)
  end


def test_letter_true_false
  assert_equal(true, @hidden_word.true_false("h"))
end

def test_hide_word
  assert_equal("** *****", @hidden_word.display)
end

def test_get_letter_indices
  assert_equal([0, 4], @hidden_word.get_indices("h"))
end

def test_update_display
  assert_equal("h* *h***", @hidden_word.update_display("h"))
end



# def test_evaluate_guess__word
#   result = @game.pass_guess_to_hidden_word("hi there")
#   assert_equal(true, result)
# end

# def test_evaluate_guess__correct_word
#    @game.pass_guess_to_hidden_word("hi there")
#   assert_equal(true, @game.won?)
# end
#
# def test_evaluate_guess__incorrect_word
#    @game.pass_guess_to_hidden_word("jam")
#   assert_equal(5, @player.lives)
# end


end
