require 'test_helper'

class TestEncodersBase < Minitest::Test

  def test_supported_class
    supported_class = MorseCode::Encoders::Base.new('我').supported_class
    assert_equal supported_class, MorseCode::Encoders::Chinese

    supported_class = MorseCode::Encoders::Base.new('I').supported_class
    assert_equal supported_class, MorseCode::Encoders::English
  end

end
