# frozen_string_literal: true

require 'test_helper'

class TestWave < Minitest::Test
  def test_generate
    content = '.. / .- -- / .-. ---'
    @wave = MorseCode::Wave.new(content)
    filepath = @wave.generate
    assert_match /tmp\/morse_code-\w{10}.wav/, filepath
  end
end
