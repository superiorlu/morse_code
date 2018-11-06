# frozen_string_literal: true

require 'morse_code/error'
require 'morse_code/base'

module MorseCode
  module Decoders
    class Chinese < MorseCode::Base
      MIN_CHINESE_CODEPOINT = 19_968  # \u4e00
      MAX_CHINESE_CODEPOINT = 40_869  # \u9fa5

      def supported?
        decode_binary_word >= MIN_CHINESE_CODEPOINT && decode_binary_word <= MAX_CHINESE_CODEPOINT
      end

      def call
        decode_binary_word.chr('UTF-8')
      end

      private

      def decode_binary_word
        @decode_binary_word ||= word.tr('.', '0').tr('-', '1').to_i(2)
      end
    end
  end
end
