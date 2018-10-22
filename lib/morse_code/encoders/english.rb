require 'morse_code/error'
require 'morse_code/base'

module MorseCode
  module Encoders
    class English < MorseCode::Base

      def supported?
        !MorseCode::ENCODE_MAP[word].nil?
      end

      def encode
        MorseCode::ENCODE_MAP[word]
      end
    end
  end
end
