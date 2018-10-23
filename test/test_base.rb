# frozen_string_literal: true

require 'test_helper'

class TestDecodersBase < Minitest::Test
  def test_encode_supported_classes
    supported_classes = MorseCode::Base.new('我').supported_classes
    assert_equal supported_classes, [MorseCode::Encoders::Chinese]

    supported_classes = MorseCode::Base.new('I').supported_classes
    assert_equal supported_classes, [MorseCode::Encoders::English]
  end

  def test_decode_supported_classes
    supported_classes = MorseCode::Base.new('--...-....-...-').supported_classes
    assert_equal supported_classes, [MorseCode::Decoders::Chinese]

    supported_classes = MorseCode::Base.new('-').supported_classes
    assert_equal supported_classes, [MorseCode::Encoders::English, MorseCode::Decoders::English]
  end
end
