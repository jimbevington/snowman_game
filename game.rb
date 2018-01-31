
class Game
  attr_reader :player, :hidden_word, :guessed_letters
  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def pass_guess_to_hidden_word(guess)
    @hidden_word.evaluate_guess(guess)
  end

  def add_guess_to_guessed_letters(letter)
    @guessed_letters.push(letter)
  end

  def test_guess(result)
    unless result
      @player.lose_life
    end
  end

  def won?

    unless @hidden_word.word.include?("*")
      return true
    end
  end

def lost?
 player.lives == 0
end

def player_lose_life
  @player.lose_life
end
end
