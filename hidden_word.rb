class HiddenWord
  attr_reader :word, :display
  def initialize(word)
    @word = word
    @display =  @word.tr("a-z", "*")

  end

  def true_false(letter)
    return @word.include?(letter)
  end

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

  def update_display(letter)
    for index in self.get_indices(letter)
      @display[index] = letter
    end
    return @display
  end



end
