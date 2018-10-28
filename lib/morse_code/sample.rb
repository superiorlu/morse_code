module MorseCode
  class Sample
    DIT_LENGTH = 60
    DAH_LENGTH = 3 * DIT_LENGTH
    DIT_SPACE  = DIT_LENGTH
    CHAR_SPACE = 3 * DIT_LENGTH
    WORD_SPACE = 7 * DIT_LENGTH

    attr_reader :message, :frequency, :sample_rate

    def initialize(message, frequency = 600, sample_rate = 8000)
      @message = message
      @frequency = frequency
      @sample_rate = sample_rate
    end

    # 8-bit unsigned PCM format
    def pcm_samples
      @pcm_samples ||= [].tap do |pcm_samples|
        samples.each { |sample| pcm_samples.push(128 + (127 * sample).round) }
      end
    end

    private

    def samples
      @samples ||= [].tap do |samples|
        counter = 2 * Math::PI * frequency / sample_rate
        return samples if timings.empty?

        flag = timings.first > 0 ? 1 : 0
        timings.each do |time|
          duration = sample_rate * time.abs / 1000
          0.upto(duration).each do |i|
            samples.push(flag * Math.sin(i * counter))
          end
          flag = 1 - flag
        end
      end
    end

    def timings
      @timings ||= [].tap do |timings|
        message.each_char do |char|
          case char
          when '.' then timings.push(DIT_LENGTH); timings.push(-DIT_SPACE)
          when '-' then timings.push(DAH_LENGTH); timings.push(-DIT_SPACE)
          when ' ' then timings.pop; timings.push(-CHAR_SPACE)
          when '/' then timings.pop; timings.push(-WORD_SPACE)
          end
        end
        timings.pop if timings.last == -DIT_SPACE
      end
    end
  end
end
