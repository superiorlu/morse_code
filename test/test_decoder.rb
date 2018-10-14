require 'test_helper'

class TestDecoder < Minitest::Test

  def test_decode
    encode_message = '.. / .- -- / .-. --- -... --- - .-.-.-'
    decode_message = MorseCode::Decoder.new(encode_message).decode
    assert_equal 'I AM ROBOT.', decode_message
  end

  def test_dit_dah_to
    encode_message = 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH'
    decode_message = MorseCode::Decoder.new(encode_message).dit_dah_to
    assert_equal 'I AM ROBOT.', decode_message
  end
end
