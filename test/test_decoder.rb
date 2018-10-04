require 'test_helper'

class TestDecoder < Minitest::Test

  def test_decode
    content = '.. .- -- .-. --- -... --- - .-.-.-'
    decode_content = MorseCode::Decoder.new(content).decode
    assert_equal 'I A M R O B O T .', decode_content
  end

  def test_dit_dah_to
    content = 'DITDIT DITDAH DAHDAH DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH'
    decode_content = MorseCode::Decoder.new(content).dit_dah_to
    assert_equal 'I A M R O B O T .', decode_content
  end
end
