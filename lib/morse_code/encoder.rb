require 'morse_code/error'

module MorseCode
  class Encoder
    def initialize(content = '')
      @content = content.upcase
    end

    def encode
      [].tap do |encode_words|
        @content.split(/\s+/).each do |word|
          encode_word = []
          word.each_char { |char| encode_word << (MorseCode::ENCODE_MAP[char] || char) }
          encode_words.concat(encode_word)
        end
      end.join(' ')
    end

    def encode_with
      encode.tap { |content| content.gsub!('.', 'DIT'); content.gsub!('-', 'DAH') }
    end
    alias dit_dah encode_with
  end
end
