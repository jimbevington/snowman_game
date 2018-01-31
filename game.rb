
class Game
  attr_reader :player, :hidden_word, :guessed_letters
  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def pass_guess_to_hidden_word(letter)
    @hidden_word.true_false(letter)
  end

  def add_guess_to_guessed_letters(letter)
    @guessed_letters.push(letter)
  end

  def test_guess(result)
    unless result
      @player.lose_life
    end
  end

end
