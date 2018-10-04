require 'morse_code/error'

module MorseCode
  class Decoder
    def initialize(content = '')
      @content = content
    end

    def decode
      [].tap do |decode_words|
        @content.split(/\s+/).each do |word|
          decode_words << (MorseCode::DECODE_MAP[word] || word)
        end
      end.join(' ')
    end

    def decode_with
      @content.tap { |content| content.gsub!('DIT', '.'); content.gsub!('DAH', '-') }
      decode
    end
    alias dit_dah_to decode_with
  end
end
