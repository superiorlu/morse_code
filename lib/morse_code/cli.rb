# frozen_string_literal: true

require 'thor'

module MorseCode
  class Cli < Thor
    package_name 'mc'
    map '-e' => :encode
    map '-d' => :decode

    desc 'encode MESSAGE', 'encode message as Morse Code'
    method_option :dit_dah, aliases: '-d', type: :boolean, desc: 'encode DITDAH message'
    def encode(message = '')
      if options[:dit_dah]
        puts MorseCode::Encoder.new(message).dit_dah
      else
        puts MorseCode::Encoder.new(message).encode
      end
    end

    desc 'decode MESSAGE', 'decode Morse Code as original message'
    method_option :dit_dah, aliases: '-d', type: :boolean, desc: 'decode from DITDAH message'
    def decode(message = '')
      if options[:dit_dah]
        puts MorseCode::Decoder.new(message).dit_dah_to
      else
        puts MorseCode::Decoder.new(message).decode
      end
    end
  end
end
