# frozen_string_literal: true

module MorseCode
  class Error < StandardError; end

  class NotSupportedError < Error; end

  class NotImplementedError < Error; end
end
