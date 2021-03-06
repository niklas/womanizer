#!/usr/bin/env ruby

class Womanizer
  VERSION = '0.1.1'

  def self.ok!(*a)
    $womanizer = Womanizer.new(*a)
    $womanizer.define!
  end

  def initialize(*words)
    words = ['morewoman', 'morewomen'] if words.empty?
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
          @dec[t] = o

          debug { "#{o} => #{t}" }
        end
      end
    rescue StopIteration
      #done
    end
  end
  def encode(source)
    source.each_byte.map { |b| @enc[b] }.join(' ')
  end

  def decode(encoded)
    encoded.split(/\s+/).map { |t| @dec.fetch(t) }.pack('C*').
      force_encoding(Encoding.default_external)
  end

  def define!
    @dec.each do |t,c|
      Kernel.send(:define_method, t) {|r=''| [c].pack('C')+r }
    end
    Kernel.send(:alias_method, 'ok', 'eval')
  end

private

  def debug
    if $DEBUG
      STDERR.puts yield
    end
  end
end
