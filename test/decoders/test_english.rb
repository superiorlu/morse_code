# frozen_string_literal: true

require 'test_helper'

class TestDecodersEnglish < Minitest::Test
  def test_supported
    encoder = MorseCode::Decoders::English.new('..')
    assert_equal true, encoder.supported?

    encoder = MorseCode::Decoders::English.new('-..--')
    assert_equal false, encoder.supported?
  end

  def test_encode
    englisth_encoder = MorseCode::Decoders::English.new('..')
    assert_equal 'I', englisth_encoder.decode
  end
end
