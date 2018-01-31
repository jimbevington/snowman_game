class HiddenWord
  attr_reader :word, :display
  def initialize(word)
    @word = word
    @display = ""
  end

  def true_false(letter)
    return @word.include?(letter)
  end
end
