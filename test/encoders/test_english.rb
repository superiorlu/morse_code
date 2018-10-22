require 'test_helper'

class TestEncodersEnglish < Minitest::Test

  def test_supported
    encoder = MorseCode::Encoders::English.new('I')
    assert_equal true, encoder.supported?

    encoder = MorseCode::Encoders::English.new('￥')
    assert_equal false, encoder.supported?
  end

  def test_encode
    englisth_encoder = MorseCode::Encoders::English.new('I')
    assert_equal '..', englisth_encoder.encode
  end
end
