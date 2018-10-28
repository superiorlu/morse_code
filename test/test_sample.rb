# frozen_string_literal: true

require 'test_helper'

class TestSample < Minitest::Test
  def test_pcm_samples
    @sample = MorseCode::Sample.new('.. / .- -- / .-. --- -... --- - .-.-.-')
    pcm_samples = @sample.pcm_samples
    assert pcm_samples.all? { |s| s >= 0 && s <= 255 }
  end

  def test_pcm_samples_with_empty_message
    @sample = MorseCode::Sample.new('')
    pcm_samples = @sample.pcm_samples
    assert_equal [], pcm_samples
  end
end
