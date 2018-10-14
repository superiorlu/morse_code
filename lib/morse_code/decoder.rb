require 'morse_code/error'

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
            word.push(MorseCode::DECODE_MAP[char] || char)
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
  end
end
