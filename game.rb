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

  def display_guessed_letters
    # concat this with an ennumerable
    p @guessed_letters
  end


  def get_guesses()
    # Display Info
    p "#{@hidden_word.display}   -   Your guesses: #{guessed_letters}"
    # Request some input
    p "Guess a letter:"
    # Assign input to variable - UNTESTED!, HOW DO I TEST A GETS.CHOMP???
    guess = gets.chomp.downcase # make sure its all downcase
    # Enter guess into game logic
    parse_guess(guess)
  end

  def get_hidden_word()
    p "Enter a word to hide."
    @hidden_word.word = gets.chomp.downcase # assign the input to hidden_word
  end

  # INCOMPLETE, won't pass tests
  # def play
  #
  #   get_hidden_word() # get a hidden word
  #
  #   # keep asking for guesses until the game is won or lost
  #   while won? == false || lost? == false
  #     get_guesses
  #   end
  #
  #   # when won/lost, let user know
  #   if won?
  #     p "You Win!"
  #   else
  #     p "You Lose!"
  #   end
  #
  # end

end
