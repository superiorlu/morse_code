require 'morse_code/error'

module MorseCode
  class Encoder
    def initialize(message = '')
      @message = message.upcase
    end

    def encode
      [].tap do |encode_words|
        @message.split(/\s+/).each do |word|
          encode_word = []
          word.each_char { |char| encode_word << (MorseCode::ENCODE_MAP[char] || char) }
          encode_words.concat(encode_word)
        end
      end.join(' ')
    end

    def encode_with
      encode.tap { |message| message.gsub!('.', 'DIT'); message.gsub!('-', 'DAH') }
    end
    alias dit_dah encode_with
  end
end
