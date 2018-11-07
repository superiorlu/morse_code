# frozen_string_literal: true

require 'morse_code/error'
require 'morse_code/base'
require 'morse_code/encoders/chinese'
require 'morse_code/encoders/english'

module MorseCode
  class Encoder
    include MorseCode::Cacheable

    def initialize(message = '')
      @message = message.upcase
    end

    def encode
      @encode ||= [].tap do |encode_words|
        @message.split(/\s+/).each do |word|
          encode_words.concat(encode_word(word))
        end
        encode_words.pop
      end.join(' ')
    end

    def encode_with
      encode.dup.tap { |message| message.gsub!('.', 'DIT').gsub!('-', 'DAH') }
    end
    alias dit_dah encode_with

    def wave
      MorseCode::Wave.new(encode).generate
    end

    private

    def encode_word(word)
      encode_word = []
      word.each_char { |char| encode_word << encode_letter(char) }
      encode_word.push('/')
    end

    def encode_letter(letter)
      fetch(letter) do
        MorseCode::Base.new(letter, self.class.name).call
      end
    end
  end
end
