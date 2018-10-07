require 'morse_code/error'

module MorseCode
  class Decoder
    def initialize(message = '')
      @message = message.dup
    end

    def decode
      [].tap do |decode_words|
        @message.split(/\s+/).each do |word|
          decode_words << (MorseCode::DECODE_MAP[word] || word)
        end
      end.join(' ')
    end

    def decode_with
      @message.tap { |message| message.gsub!('DIT', '.'); message.gsub!('DAH', '-') }
      decode
    end
    alias dit_dah_to decode_with
  end
end
