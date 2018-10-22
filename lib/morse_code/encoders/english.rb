require 'morse_code/error'
require_relative 'base'

module MorseCode
  module Encoders
    class English < Base

      def supported?
        !MorseCode::ENCODE_MAP[word].nil?
      end

      def encode
        MorseCode::ENCODE_MAP[word]
      end
    end
  end
end