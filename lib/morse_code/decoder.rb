# frozen_string_literal: true

require 'morse_code/error'
require 'morse_code/base'
require 'morse_code/decoders/chinese'
require 'morse_code/decoders/english'

module MorseCode
  class Decoder
    include MorseCode::Cacheable

    def initialize(message = '')
      @message = message.dup
    end

    def decode
      [].tap do |decode_words|
        word = []
        @message.split(/\s+/).each do |char|
          if char == '/'
            decode_words.push(word.join)
            word = []
          else
            word.push(decode_char(char))
          end
        end
        decode_words.push(word.join) unless word.empty?
      end.join(' ')
    end

    def decode_with
      @message.tap { |message| message.gsub!('DIT', '.'); message.gsub!('DAH', '-') }
      decode
    end
    alias dit_dah_to decode_with

    private

    def decode_char(char)
      fetch(char) do
        MorseCode::Base.new(char, self.class.name).call
      end
    end
  end
end
