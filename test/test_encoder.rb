require 'test_helper'

class TestEncoder < Minitest::Test

  def test_encode
    content = 'I am Robot.'
    encode_content = MorseCode::Encoder.new(content).encode
    assert_equal '.. .- -- .-. --- -... --- - .-.-.-', encode_content
  end

  def test_dit_dah
    content = 'I am Robot.'
    encode_content = MorseCode::Encoder.new(content).dit_dah
    assert_equal 'DITDIT DITDAH DAHDAH DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH', encode_content
  end
end
