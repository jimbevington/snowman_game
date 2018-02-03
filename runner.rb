
require_relative('./game.rb')
require_relative('./hidden_word.rb')
require_relative('./player.rb')

player = Player.new("Jim")
hidden_word = HiddenWord.new("")
game = Game.new(player, hidden_word)

game.get_hidden_word()

puts %x{clear}

while game.inplay do

  # Display Info
  p "#{hidden_word.display}"
  game.display_guessed_letters()

  guess = game.get_guess()
  game.parse_guess(guess)
  game.check_won_lost?

  if game.won
    p "Congratulations! You WIN!!!"
  elsif game.lost
    p "Oh dear, you LOSE!!!"
  end

end
