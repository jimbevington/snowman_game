class Game

  attr_reader :player, :hidden_word, :guessed_letters, :won, :lost, :inplay

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
    @won = false
    @lost = false
    @inplay = true
  end

  def is_a_word?(guess)
    guess.length > 1
  end

  def correct_word?(guess)
    return guess == @hidden_word.word
  end

  def guess_letter(guess)
    if @hidden_word.true_false(guess)
      @hidden_word.update_display(guess)
    else
      subtract_player_life
    end
    add_guess_to_guessed_letters(guess)
  end

  # call different functions based on guess
  def parse_guess(guess)
    if is_a_word?(guess)
      if correct_word?(guess) # if it is a word, is it the correct word?
        @hidden_word.reveal_word # if so, reveal the word
      else
        subtract_player_life() # call other function to dock life
      end
    else # if not a word
      guess_letter(guess)
    end
  end

  # ADD TO GUESSED LETTERS
  def add_guess_to_guessed_letters(letter)
    @guessed_letters.push(letter)
  end

  # BE ABLE TO SUBTRACT FROM PLAYER LIFE
  def subtract_player_life
    @player.lose_life
  end

  # CHECK IF GAME IS WON
  def check_won?
    unless @hidden_word.display.include?("*")
      @won = true
      @inplay = false
    end
  end

  # CHECK IF GAME IS LOST
  def check_lost?
   if @player.lives == 0
     @lost = true
     @inplay = false
   end
  end

  def check_won_lost?
    check_won?
    check_lost?
  end

  def display_guessed_letters
    # concat this with an ennumerable
    p "Guesses: #{@guessed_letters.join(", ")}"
  end

  def get_guess()
    p "Guess a letter:"
    return guess = gets.chomp.downcase # make sure its all downcase
  end

  def get_hidden_word()
    p "Enter a word to hide."
    @hidden_word.word = gets.chomp.downcase # assign the input to hidden_word
    @hidden_word.add_word_to_display
    return nil
  end



end
