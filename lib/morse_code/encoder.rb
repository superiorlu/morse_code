require 'morse_code/error'
require 'morse_code/base'
require 'morse_code/encoders/chinese'
require 'morse_code/encoders/english'

module MorseCode
  class Encoder
    def initialize(message = '')
      @message = message.upcase
    end

    def encode
      [].tap do |encode_words|
        @message.split(/\s+/).each do |word|
          encode_words.concat(encode_word(word))
        end
        encode_words.pop
      end.join(' ')
    end

    def encode_with
      encode.tap { |message| message.gsub!('.', 'DIT'); message.gsub!('-', 'DAH') }
    end
    alias dit_dah encode_with

    private

    def encode_word(word)
      encode_word = []
      word.each_char { |char| encode_word << encode_letter(char) }
      encode_word.push('/')
    end

    def encode_letter(letter)
      supported_classes = MorseCode::Base.new(letter).supported_classes
      supported_class = supported_classes.detect { |clazz| clazz.name.start_with?('MorseCode::Encoder') }
      return supported_class.new(letter).encode if supported_class
      return letter
    end
  end
end
