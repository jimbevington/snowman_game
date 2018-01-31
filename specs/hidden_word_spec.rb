require('minitest/autorun')
require('minitest/rg')

require_relative('../hidden_word.rb')


class HiddenWordTest < MiniTest::Test
  def setup
    @hidden_word = HiddenWord.new("Political Correctness")
  end

end
