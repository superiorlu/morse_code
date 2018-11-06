# frozen_string_literal: true

require 'test_helper'

class TestEncodersChinese < Minitest::Test
  def test_supported
    encoder = MorseCode::Encoders::Chinese.new('我')
    assert_equal true, encoder.supported?

    encoder = MorseCode::Encoders::Chinese.new('W')
    assert_equal false, encoder.supported?
  end

  def test_encode
    chinese_encoder = MorseCode::Encoders::Chinese.new('我')
    assert_equal '--...-....-...-', chinese_encoder.call
  end
end
