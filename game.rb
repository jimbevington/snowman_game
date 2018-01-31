
class Game
  attr_reader :player, :hidden_word, :guessed_letters
  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end
end
