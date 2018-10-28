require 'wavefile'
require 'digest'
module MorseCode
  class Wave
    include WaveFile

    attr_reader :message

    def initialize(message, frequency = 600, sample_rate = 8000)
      @message = message
      @sample_rate = sample_rate
      @sample = MorseCode::Sample.new(message, frequency, sample_rate)
    end

    def generate
      buffer = WaveFile::Buffer.new(pcm_samples, WaveFile::Format.new(:mono, :float, @sample_rate))
      WaveFile::Writer.new(filepath, WaveFile::Format.new(:mono, :pcm_16, @sample_rate)) do |writer|
        writer.write(buffer)
      end
      filepath
    end

    private

    def filepath
      "/tmp/morse_code-#{filename}"
    end

    def filename
      "#{Digest::MD5.hexdigest(message)[0, 10]}.wav"
    end

    def pcm_samples
      @pcm_samples ||= @sample.pcm_samples
    end
  end
end
