module GamesHelper
  def word_from_letters?(word, letters_array)
    word.upcase.chars.all? do |letter|
      word.upcase.count(letter) <= letters_array.count(letter)
    end
  end

  def a_word?(word)
    begin
      response = URI.parse("https://wagon-dictionary.herokuapp.com/#{word}")
      json = JSON.parse(response.read)
      json['found']
    rescue OpenURI::HTTPError => e
      Rails.logger.error("HTTP Error: #{e.message}")
      false
    end
  end
end
