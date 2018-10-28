# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.start do
  add_filter %r{^/test/}
end

require 'pry'
require 'morse_code'
require 'minitest/autorun'
require 'mocha/minitest'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
