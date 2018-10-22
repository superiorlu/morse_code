require 'morse_code/error'
require 'morse_code/base'

module MorseCode
  module Decoders
    class English < MorseCode::Base

      def supported?
        !MorseCode::DECODE_MAP[word].nil?
      end

      def decode
        MorseCode::DECODE_MAP[word]
      end
    end
  end
end
