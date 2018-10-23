# frozen_string_literal: true

require 'morse_code/error'

module MorseCode
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

    def supported_classes
      supported_classes = Array(@@subclasses).select { |subclass| subclass.new(word).supported? }
      puts "[WARING] Not Classs can support this #{word}!" if supported_classes.empty?
      supported_classes
    end
  end
end
