require 'morse_code/error'
require 'morse_code/base'

module MorseCode
  module Encoders
    class Chinese < MorseCode::Base

      def supported?
        !/\p{Han}/.match(word).nil? # \u4e00-\u9fa5
      end

      def encode
        word.ord.to_s(2).gsub!('0', '.').gsub!('1', '-')
      end
    end
  end
end
