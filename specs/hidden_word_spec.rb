require('minitest/autorun')
require('minitest/rg')

require_relative('../hidden_word.rb')


class HiddenWordTest < MiniTest::Test
  def setup
    @hidden_word = HiddenWord.new("hi there")
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
end
