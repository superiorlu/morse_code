# frozen_string_literal: true

require 'morse_code/error'

module MorseCode
  class Base
    def self.inherited(subclass)
      @@subclasses ||= []
      @@subclasses << subclass
    end

    attr_reader :word, :namespace

    def initialize(word = '', namespace = '')
      @word = word
      @namespace = namespace
    end

    def supported?
      raise MorseCode::NotImplementedError, 'Subclass must override supported? method'
    end

    def call
      return supported_class.new(word).call if supported_class
      word
    end

    def supported_class
      supported_classes.detect { |clazz| clazz.name.start_with?(namespace) }
    end

    def supported_classes
      supported_classes = Array(@@subclasses).select { |subclass| subclass.new(word).supported? }
      puts "[WARING] Not Classs can support this #{word}!" if supported_classes.empty?
      supported_classes
    end
  end
end
