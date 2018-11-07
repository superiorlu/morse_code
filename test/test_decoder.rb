# frozen_string_literal: true

require 'test_helper'

class TestDecoder < Minitest::Test
  def test_decode
    encode_message = '.. / .- -- / .-. --- -... --- - .-.-.-'
    decode_message = MorseCode::Decoder.new(encode_message).decode
    assert_equal 'I AM ROBOT.', decode_message
  end

  def test_chinese_decode
    message = '--...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-.'
    decode_message = MorseCode::Decoder.new(message).decode
    assert_equal '我是中国人', decode_message
  end

  def test_encode_with_cache
    message = '.. / .- -- / .-. --- --- --- --- --- --- -... --- --- --- - .-.-.'
    english_decoder = mock('english_decoder')
    english_decoder.stubs(:call).returns('I')
    MorseCode::Base.expects(:new).with(any_parameters).returns(english_decoder).times(8)
    decoder = MorseCode::Decoder.new(message)
    encode_message = decoder.decode
    assert_equal 8, decoder.cache.keys.size
  end

  def test_dit_dah_to
    encode_message = 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH'
    decode_message = MorseCode::Decoder.new(encode_message).dit_dah_to
    assert_equal 'I AM ROBOT.', decode_message
  end
end
