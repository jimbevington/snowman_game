class HiddenWord

  attr_accessor :word
  attr_reader :display

  def initialize(word)
    @word = word
    @display =  @word.tr("a-z", "*")
  end

  # CHECK IF LETTER IS IN WORD
  def true_false(letter)
    return @word.include?(letter)
  end

  # CHANGE DISPLAY

  # - get indices of word with the letter
  def get_indices(letter)

    word_array = @word.split(//)
    index_array = []
    count = 0

    for l in word_array
      if l == letter
        index_array.push(count)
      end
      count += 1
    end
    return index_array

  end

  # - update the display using the word indices
  def update_display(letter)
    for index in self.get_indices(letter)
      @display[index] = letter
    end
    return @display
  end

  def reveal_word
    @display = @word
  end

end
