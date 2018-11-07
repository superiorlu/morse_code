# frozen_string_literal: true

module MorseCode
  module Cacheable
    def cache
      @cache ||= {}
    end

    def fetch(key)
      return cache[key] if cache[key]
      value = yield
      cache[key] = value
      value
    end
  end
end
