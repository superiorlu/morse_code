require 'test_helper'

class TestDecodersBase < Minitest::Test

  def test_supported_class
    supported_class = MorseCode::Decoders::Base.new('--...-....-...-').supported_class
    assert_equal supported_class, MorseCode::Decoders::Chinese

    supported_class = MorseCode::Decoders::Base.new('..').supported_class
    assert_equal supported_class, MorseCode::Decoders::English
  end

end
