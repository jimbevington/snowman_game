require('minitest/autorun')
require('minitest/rg')

require_relative('../hidden_word.rb')


class HiddenWordTest < MiniTest::Test

  ### SETUP ##################################

  def setup
    @hidden_word = HiddenWord.new("hi there")
  end

  ### TESTS ##################################

  ### test parameters ########################

  def test_has_word
    assert_equal("hi there", @hidden_word.word)
  end

  def test_display_hide_word
    assert_equal("** *****", @hidden_word.display)
  end

  ### test methods ########################

  def test_letter_true_false
    assert_equal(true, @hidden_word.true_false("h"))
  end

  def test_get_letter_indices
    assert_equal([0, 4], @hidden_word.get_indices("h"))
  end

  def test_update_display
    assert_equal("h* *h***", @hidden_word.update_display("h"))
  end

end
