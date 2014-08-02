class Womanizer
  def initialize(words=['morewoman', 'morewomen'])
    words = words.map(&:downcase).uniq

    raise ArgumentError, 'needs words with length of at least 8' if words.any? { |w| w.length < 8 }

    @enc = []
    @dec = {}

    chars = 0.upto(255).each

    begin
      words.each do |word|
        l = word.length
        f = "%0#{l}d"
        0.upto(2**l) do |i|
          o = chars.next
          b = (f % i.to_s(2)).chars.map(&:to_i)
          t = word.chars.zip(b).map do |c, u|
            if u.zero?
              c
            else
              c.upcase
            end
          end.join
          @enc[o] = t
          @dec[t] = '%c' % [o]

          debug { "#{o} => #{t}" }
        end
      end
    rescue StopIteration
      #done
    end
  end
  def encode(source)
    source.bytes.map { |b| @enc[b] }.join(' ')
  end

  def decode(encoded)
    encoded.split(/\s+/).map { |t| @dec.fetch(t) }.join
  end

private

  def debug
    if $DEBUG
      STDERR.puts yield
    end
  end
end
