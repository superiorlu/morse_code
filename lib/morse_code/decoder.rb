require 'morse_code/error'
require 'morse_code/base'
require 'morse_code/decoders/chinese'
require 'morse_code/decoders/english'

module MorseCode
  class Decoder
    def initialize(message = '')
      @message = message.dup
    end

    def decode
      [].tap do |decode_words|
        word = []
        @message.split(/\s+/).each do |char|
          if char == '/'
            decode_words.push(word.join)
            word = []
          else
            word.push(decode_char(char))
          end
        end
        decode_words.push(word.join) if word.size > 0
      end.join(' ')
    end

    def decode_with
      @message.tap { |message| message.gsub!('DIT', '.'); message.gsub!('DAH', '-') }
      decode
    end
    alias dit_dah_to decode_with

    private

    def decode_char(char)
      supported_classes = MorseCode::Base.new(char).supported_classes
      supported_class = supported_classes.detect { |clazz| clazz.name.start_with?('MorseCode::Decoder') }
      return supported_class.new(char).decode if supported_class
      return char
    end
  end
end
