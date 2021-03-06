# frozen_string_literal: true

require 'morse_code/error'
require 'morse_code/base'

module MorseCode
  module Encoders
    class English < MorseCode::Base
      def supported?
        !MorseCode::ENCODE_MAP[word].nil?
      end

      def call
        MorseCode::ENCODE_MAP[word]
      end
    end
  end
end
