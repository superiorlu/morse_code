require 'morse_code/error'
require_relative 'base'

module MorseCode
  module Encoders
    class Chinese < Base

      def supported?
        !/\p{Han}/.match(word).nil? # \u4e00-\u9fa5
      end

      def encode
        word.ord.to_s(2).gsub!('0', '.').gsub!('1', '-')
      end
    end
  end
end
