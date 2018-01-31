class HiddenWord
  attr_reader :word, :display
  def initialize(word)
    @word = word
    @display =  @word.tr("a-z", "*")

  end

  def true_false(letter)
    return @word.include?(letter)
  end

  # def hide_word
  #   @display = @word.tr("a-z", "*")
  # end

end
