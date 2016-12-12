module BookHelper
  def to_high(string)
    word_array = string.split(' ')
    word_array.each{ |word| word.capitalize! }
    word_array.join(' ')
  end
  def carusel_windows(book_img_len)
    result = ""
    if book_img_len > 1
      (book_img_len - 1).times do
        |i|
        result += "<li data-target=\"#myCarousel\" data-slide-to=\"" + i.to_s + "\"></li>"
      end
    end
    result
  end
end