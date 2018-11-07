# frozen_string_literal: true

require 'test_helper'

class TesCli < Minitest::Test

  def cli
    @cli ||= MorseCode::Cli.new
  end

  def test_encode
    out, _ = capture_io do
      cli.encode 'I am RobotB.'
    end
    assert_equal ".. / .- -- / .-. --- -... --- - -... .-.-.-\n", out
  end

  def test_encode_with_dit_dah
    cli.stubs(:options).returns(dit_dah: true)
    out, _ = capture_io do
      cli.encode 'I am RobotB.'
    end
    assert_equal "DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DAHDITDITDIT DITDAHDITDAHDITDAH\n", out
  end

  def test_encode_with_wave
    cli.stubs(:options).returns(wave: true)
    out, _ = capture_io do
      cli.encode 'I am RobotB.'
    end
    assert_match %r{Generate wave file: /tmp/morse_code-}, out
  end

  def test_decode_with_dit_dah
    cli.stubs(:options).returns(dit_dah: true)
    out, _ = capture_io do
      cli.decode 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DAHDITDITDIT DITDAHDITDAHDITDAH'
    end
    assert_equal "I AM ROBOTB.\n", out
  end

  def test_decode
    out, _ = capture_io do
      cli.decode '.. / .- -- / .-. --- -... --- - -... .-.-.-'
    end
    assert_equal "I AM ROBOTB.\n", out
  end

  def test_encode_on_terminal
    out, _ = capture_subprocess_io do
      system("mc -e 'I am Robot.'")
    end
    assert_equal ".. / .- -- / .-. --- -... --- - .-.-.-\n", out
  end

  def test_encode_with_wave_on_terminal
    out, _ = capture_subprocess_io do
      system("mc -e 'I am Robot.' -w")
    end
    assert_match %r{Generate wave file: /tmp/morse_code-}, out
  end

  def test_decode_on_terminal
    out, _ = capture_subprocess_io do
      system("mc -d '.. / .- -- / .-. --- -... --- - .-.-.-'")
    end
    assert_equal "I AM ROBOT.\n", out
  end
end
