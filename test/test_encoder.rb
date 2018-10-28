# frozen_string_literal: true

require 'test_helper'

class TestEncoder < Minitest::Test
  def test_encode
    message = 'I am Robot.'
    encode_message = MorseCode::Encoder.new(message).encode
    assert_equal '.. / .- -- / .-. --- -... --- - .-.-.-', encode_message
  end

  def test_chinese_encode
    message = '我是中国人'
    encode_message = MorseCode::Encoder.new(message).encode
    wave = MorseCode::Wave.new(encode_message)
    assert_equal '--...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-.', encode_message
  end

  def test_dit_dah
    message = 'I am Robot.'
    encode_message = MorseCode::Encoder.new(message).dit_dah
    assert_equal 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH', encode_message
  end
end
