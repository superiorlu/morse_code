# frozen_string_literal: true

require 'thor'

module MorseCode
  class Cli < Thor
    package_name 'mc'
    map '-e' => :encode
    map '-d' => :decode

    desc 'encode MESSAGE', 'encode message as Morse Code'
    method_option :dit_dah, aliases: '-d', type: :boolean, desc: 'encode DITDAH message'
    method_option :wave, aliases: '-w', type: :boolean, desc: 'gen morse code wav'
    def encode(message = '')
      encoder = MorseCode::Encoder.new(message)
      if options[:dit_dah]
        puts encoder.dit_dah
      else
        puts encoder.encode
      end
      if options[:wave]
        wavefile = encoder.wave
        puts "Generate wave file: #{wavefile}"
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
