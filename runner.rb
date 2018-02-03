
require_relative('./game.rb')
require_relative('./hidden_word.rb')
require_relative('./player.rb')

player = Player.new("Jim")
hidden_word = HiddenWord.new("")
game = Game.new(player, hidden_word)

game.get_hidden_word()

while game.inplay do

  puts %x{clear} # clear terminal screen
  # Display Info
  p "#{hidden_word.display}"
  game.display_guessed_letters()
  p "You have #{player.lives} remaining guesses."
  guess = game.get_guess()
  game.parse_guess(guess)
  game.check_won_lost?

  if game.won
    puts %x{clear} # clear terminal screen
    p "#{hidden_word.display.upcase}"
    p "Congratulations! You WIN!!!"
  elsif game.lost
    puts %x{clear} # clear terminal screen
    p "Oh dear, you LOSE!!!"
  end

end
