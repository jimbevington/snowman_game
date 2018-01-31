
class Game
  attr_reader :player, :hidden_word
  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
  end
end
