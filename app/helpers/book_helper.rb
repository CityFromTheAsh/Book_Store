module BookHelper
  def to_high(string)
    word_array = string.split(' ')
    word_array.each{|word| word.capitalize!}
    word_array.join(' ')
  end

end