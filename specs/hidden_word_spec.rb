require('minitest/autorun')
require('minitest/rg')

require_relative('../hidden_word.rb')


class HiddenWordTest < MiniTest::Test
  def setup
    @hidden_word = HiddenWord.new("Political Correctness")
  end

  def test_has_word
    assert_equal("Political Correctness", @hidden_word.word)
  end

end
