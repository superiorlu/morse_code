# frozen_string_literal: true

require 'test_helper'

class TestDecodersChinese < Minitest::Test
  def test_supported
    encoder = MorseCode::Decoders::Chinese.new('--...-....-...-')
    assert_equal true, encoder.supported?

    encoder = MorseCode::Decoders::Chinese.new('..')
    assert_equal false, encoder.supported?
  end

  def test_decode
    chinese_encoder = MorseCode::Decoders::Chinese.new('--...-....-...-')
    assert_equal '我', chinese_encoder.decode
  end
end
