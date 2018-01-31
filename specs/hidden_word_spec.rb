require('minitest/autorun')
require('minitest/rg')

require_relative('../hidden_word.rb')


class HiddenWordTest < MiniTest::Test
  def setup
    @hidden_word = HiddenWord.new("political correctness")
  end

  def test_has_word
    assert_equal("political correctness", @hidden_word.word)
  end

  def test_display__none
    assert_equal("", @hidden_word.display)
  end

def test_letter_true_false
  assert_equal(true, @hidden_word.true_false("p"))
end
end
