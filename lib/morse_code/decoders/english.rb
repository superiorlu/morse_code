require 'morse_code/error'
require_relative 'base'

module MorseCode
  module Decoders
    class English < Base

      def supported?
        !MorseCode::DECODE_MAP[word].nil?
      end

      def decode
        MorseCode::DECODE_MAP[word]
      end
    end
  end
end
