# frozen_string_literal: true

require 'test_helper'

class TestBase < Minitest::Test
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

  def test_supported
    morse_code = MorseCode::Base.new('test')
    error = assert_raises MorseCode::NotImplementedError do
     morse_code.supported?
    end
    assert_equal 'Subclass must override supported? method', error.message
  end

  def test_no_supported_class
    morse_code = MorseCode::Base.new('@_@', 'MorseCode::Encoder')
    encode_message = morse_code.call
    assert_equal '@_@', encode_message
  end
end
