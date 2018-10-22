require 'morse_code/error'

module MorseCode
  module Decoders
    class Base

      def self.inherited(subclass)
        @@subclasses ||= []
        @@subclasses << subclass
      end

      attr_reader :word

      def initialize(word = '')
        @word = word
      end

      def supported?
        raise NotImplementedError, 'Subclass must override supported? method'
      end

      def supported_class
        supported_class = Array(@@subclasses).detect { |subclass| subclass.new(word).supported? }
        puts "[WARING] Not Classs can decode this #{word}!" unless supported_class
        supported_class
      end
    end
  end
end