
class Game

  attr_reader :player, :hidden_word, :guessed_letters

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def is_a_word?(guess)
    guess.length > 1
  end

  def correct_word?(guess)
    return guess == @hidden_word.word
  end

  def parse_guess(guess)
    if is_a_word?(guess)
      return correct_word?(guess)
    end
  end

  # def evaluate_guess(guess)
  #   if is_a_word?(guess)
  #     if guess == @word
  #       @display = @word
  #     else
  #       @game.player_lose_life
  #     end
  #   end
  # end

  # ADD TO GUESSED LETTERS
  def add_guess_to_guessed_letters(letter)
    @guessed_letters.push(letter)
  end

  # PASS A LETTER TO HIDDEN WORD -- !!!!!! change
  # def pass_guess_to_hidden_word(guess)
  #   @hidden_word.evaluate_guess(guess)
  # end

  # BE ABLE TO SUBTRACT FROM PLAYER LIFE

  # CHECK IF GAME IS WON
  def won?
    unless @hidden_word.display.include?("*")
      return true
    end
    return false # return false if display includes *
  end

  # CHECK IF GAME IS LOST
  def lost?
   @player.lives == 0
  end


end
